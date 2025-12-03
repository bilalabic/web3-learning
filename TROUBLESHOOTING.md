# Troubleshooting Guide

This guide helps you solve common problems you might encounter during the 21-Day Sui Move Challenge.

---

## Installation Issues

### Error: "sui: command not found"

**Problem:** Sui CLI is not installed or not in your PATH.

**Solutions:**

1. **Verify Rust is installed:**
   ```bash
   rustc --version
   ```
   If not found, install Rust first:
   ```bash
   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
   ```

2. **Reload your shell configuration:**
   ```bash
   source $HOME/.cargo/env
   ```

3. **Check if Sui binary exists:**
   ```bash
   ls ~/.cargo/bin/sui
   ```
   If not found, reinstall:
   ```bash
   cargo install --locked --git https://github.com/MystenLabs/sui.git --branch mainnet sui
   ```

4. **Restart your terminal** completely (close and reopen).

---

## Build Errors

### Error: "could not find module"

**Example:**
```
error[E03002]: unbound module
   ┌─ sources/main.move:1:1
   │
 1 │ module challenge::day_01 {
   │        ^^^^^^^^^ Unbound module or type alias 'challenge'
```

**Problem:** You're in the wrong directory or Move.toml is missing.

**Solutions:**

1. **Check you're in the correct day's folder:**
   ```bash
   pwd
   ```
   Should show: `.../21Challenge/day_01` (or day_02, etc.)

2. **Navigate to the correct folder:**
   ```bash
   cd day_01
   ```

3. **Verify Move.toml exists:**
   ```bash
   ls Move.toml
   ```
   If missing, copy from another day or check the repository.

---

### Error: "syntax error"

**Example:**
```
error: unexpected token
   ┌─ sources/main.move:10:5
   │
10 │     pubic fun sum(a: u64, b: u64): u64 {
   │     ^^^^^ unexpected token
```

**Problem:** Typo in your code (in this case, `pubic` instead of `public`). If you've faced this problem you can check to the solution code.

**Solutions:**

1. **Read the error message carefully** - it shows the line number (10) and what's wrong.

2. **Common typos:**
   - `pubic` → `public`
   - `pubilc` → `public`
   - Missing semicolon `;`
   - Missing comma `,`
   - Missing closing brace `}`

3. **Use VS Code** - it highlights syntax errors in real-time.


---

### Error: "use of moved value"

**Example:**
```
error: cannot use value after move
   ┌─ sources/main.move:20:9
   │
20 │     let habit = new_habit(b"Run");
21 │     add_habit(&mut list, habit);
22 │     add_habit(&mut list, habit);  // Error: habit was moved
   │                          ^^^^^ value used here after move
```

**Problem:** You're trying to use a value that was already moved (ownership transferred).

**Solutions:**

1. **Understanding the problem:**
   ```move
   add_habit(&mut list, habit);  // habit is moved into the list
   // habit no longer exists here!
   ```

2. **Create a new value:**
   ```move
   let habit1 = new_habit(b"Run");
   let habit2 = new_habit(b"Swim");
   add_habit(&mut list, habit1);
   add_habit(&mut list, habit2);
   ```

3. **Or use references if you need to keep the value:**
   ```move
   // But check if your function accepts references
   add_habit(&mut list, &habit);  // borrow instead of move
   ```

---

## Test Errors

### Error: "test failed"

**Example:**
```
┌── test_sum ──────────────────────────────────────────────────────
│ error: assertion failed: result == 3
└──────────────────────────────────────────────────────────────────
Test result: FAILED. Total tests: 1; passed: 0; failed: 1
```

**Problem:** Your code doesn't produce the expected result.

**Solutions:**

1. **Check your function logic:**
   ```move
   // If test expects sum(1, 2) == 3
   public fun sum(a: u64, b: u64): u64 {
       a + b  // Make sure this is correct
   }
   ```

2. **Add debug output (in tests):**
   ```move
   #[test]
   fun test_sum() {
       let result = sum(1, 2);
       std::debug::print(&result);  // See what you actually got
       assert_eq!(result, 3);
   }
   ```

3. **Re-read the day's README** to understand what's expected.

---

### Error: "no tests found"

**Example:**
```
Running Move unit tests
Test result: OK. Total tests: 0; passed: 0; failed: 0
```

**Problem:** No test functions defined, or tests are commented out.

**Solutions:**

1. **Check if tests are commented:**
   ```move
   // #[test]  ← Remove the // to uncomment
   #[test]
   fun test_sum() {
       // ...
   }
   ```

2. **Verify test syntax:**
   - Must have `#[test]` attribute
   - Must be a function
   - Function name often starts with `test_`

---

## Git & Version Control Issues

### Error: "build/ folder keeps showing up in git status"

**Problem:** Build artifacts shouldn't be committed.

**Solution:**

The `.gitignore` file already excludes build files. If you see them:

1. **Check .gitignore exists:**
   ```bash
   cat .gitignore
   ```

2. **Remove tracked build files:**
   ```bash
   git rm -r --cached day_*/build
   git commit -m "Remove build artifacts"
   ```

3. **From now on, build/ folders will be ignored automatically.**

---

### What Should I Commit?

**✅ Commit these:**
- `sources/*.move` files (your code)
- `README.md` files (if you add notes)
- `Move.toml` (if you modify it)

**❌ Don't commit these:**
- `build/` folders (automatically generated)
- `Move.lock` files (automatically generated)
- `.DS_Store` (Mac system files)
- Editor config files (`.vscode/`, `.idea/`)

The `.gitignore` file handles this for you!

---

## Performance Issues

### Build or Test is Very Slow

**Problem:** First build compiles all dependencies (can take 1-2 minutes).

**Solutions:**

1. **First build is always slower** - subsequent builds are fast.

2. **Be patient** - Move is compiling the entire Sui framework.

3. **Check your system:**
   - Close other heavy applications
   - Make sure you have enough disk space (at least 5GB free)

---

## Understanding Error Messages

### How to Read Error Messages

Move error messages follow this pattern:

```
error[E03002]: unbound module
   ┌─ sources/main.move:15:5
   │
15 │     module challenge::day_01 {
   │            ^^^^^^^^^ Unbound module or type alias 'challenge'
```

**Breaking it down:**
1. `error[E03002]` - Error code (for searching documentation)
2. `unbound module` - Short description
3. `sources/main.move:15:5` - File, line 15, column 5
4. Visual pointer (`^^^^^^^`) shows exactly where the problem is
5. Explanation below

**Pro tip:** Always look at the line number and the visual pointer first!

---

## Editor Issues

### VS Code Not Showing Syntax Highlighting

**Problem:** Move extension not installed or not activated.

**Solutions:**

1. **Install Move extension:**
   - Open Extensions (Ctrl+Shift+X or Cmd+Shift+X)
   - Search "Move"
   - Install "Move" by Mysten Labs

2. **Check file extension:**
   - Files must end with `.move`
   - Not `.txt` or `.mv`

3. **Reload VS Code:**
   - Press Ctrl+Shift+P (or Cmd+Shift+P)
   - Type "Reload Window"
   - Press Enter

---

### VS Code Shows Errors But Build Works

**Problem:** Extension might be out of sync.

**Solutions:**

1. **Trust the build command** - If `sui move build` succeeds, your code is correct.

2. **Reload the window:**
   - Ctrl+Shift+P / Cmd+Shift+P
   - Type "Reload Window"

3. **Update the Move extension** to the latest version.

---

## Still Stuck?

### Before Asking for Help

1. **Re-read the error message** - it usually tells you exactly what's wrong
2. **Check the day's README** - the solution might be explained there
3. **Look at the solution file** - `sources/solution.move` in each day
4. **Try building from scratch** - delete `build/` & `Move.lock` and rebuild:
   ```bash
   rm -rf build && rm Move.lock
   sui move build
   ```

### Getting Help

If none of the above works:

1. **Check Sui Documentation:**
   - https://docs.sui.io

2. **Check Move Book:**
   - https://move-book.com

3. **Join the Community:**
   - Sui Discord
   - Sui Forum

### Reporting Bugs in This Challenge

If you find an error in the challenge materials:
- Check if it's a known issue in the repository
- Create a detailed bug report with:
  - Which day
  - What you expected
  - What actually happened
  - Error messages (copy-paste the full error)


---

**Remember:** Everyone gets stuck sometimes! Don't give up. Each error is a learning opportunity. If you read this, I'm Ali and I believe in you. You got this.
