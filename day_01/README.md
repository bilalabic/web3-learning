# Day 1: Modules + Primitive Types

## What You'll Learn Today

Today is your first day learning Move! You'll learn:
- How to create a Move module
- What primitive types are (u64, bool, address, etc.)
- Basic Move syntax

## Understanding Modules

A **module** in Move is like a container for your code. Think of it as a file that groups related functions and data structures together.

In Move, every module has:
- A name (like `challenge::day_01`)
- Functions (code that does something)
- Structs (data structures)

The basic structure looks like this:
```move
module challenge::day_01 {
    // Your code goes here
}
```

## Understanding Primitive Types

Move has several built-in types called **primitive types**:
- `u64` - Unsigned 64-bit integer (0, 1, 2, 3, ...)
- `u8` - Unsigned 8-bit integer (0-255)
- `bool` - Boolean (true or false)
- `address` - A blockchain address (like 0x123...)
- `vector<T>` - A list of items (we'll learn this later)

## Understanding Constants

In Move, you can define **constants** at the module level:

```move
const NUMBER: u64 = 42;
const FLAG: bool = true;
const MY_ADDRESS: address = @0x1;
```

**Rules:**
- Use `const` keyword
- Names must be UPPERCASE
- Constants are immutable

## Why Is Day 1 So Simple?

You might notice there's not much code to write today. That's intentional!

**Day 1 is about:**
- ✅ Setting up your environment
- ✅ Running your first commands (`sui move build`, `sui move test`)
- ✅ Understanding the project structure
- ✅ Getting familiar with Move syntax
- ✅ Building confidence!

**Tomorrow (Day 2)** you'll write your first function. For today, focus on getting comfortable with the tools and workflow.

## Understanding Move.toml

Every Move project needs a `Move.toml` file. Let's look at what's inside:

```toml
[package]
name = "day_01"           # Your package name
version = "1.0.0"         # Version number
edition = "2024"          # Move language edition

[dependencies]
Sui = { git = "https://github.com/MystenLabs/sui.git",
        subdir = "crates/sui-framework/packages/sui-framework",
        rev = "framework/mainnet" }

[addresses]
challenge = "0x0"         # Your module address
```

**What each part means:**
- **[package]** - Basic information about your project
- **[dependencies]** - External libraries (here, the Sui framework)
- **[addresses]** - Named addresses (here, `challenge` is an alias for `0x0`)

**Do you need to modify this?** Not for this challenge! It's already set up correctly for you.

**What is `challenge::day_01`?**
- `challenge` comes from `[addresses]` (it's `0x0`)
- `day_01` is the module name
- Together: `challenge::day_01` = the full module path

## Your Task

1. Open `sources/main.move`
2. Define three constants using primitive types (follow the TODO instructions)
3. Build and test: `sui move build` and `sui move test`
4. (Optional) Read the Move.toml file to understand the project configuration

**Your constants should look like:**
```move
const NUMBER: u64 = 42;
const FLAG: bool = true;
const MY_ADDRESS: address = @0x1;
```

**Expected output:**
```
BUILDING day_01
Build successful
```

**No tests yet?** That's normal! Day 1 has no test functions yet. We'll start testing in Day 2.

## Reading Materials

Before coding, read these sections from Move Book:

1. **Hello World** - Learn how to create your first Move package:
   [https://move-book.com/your-first-move/hello-world/](https://move-book.com/your-first-move/hello-world/)

2. **Modules** - Understand module structure:
   [https://move-book.com/move-basics/module/](https://move-book.com/move-basics/module/)

3. **Primitive Types** - Learn about basic types:
   [https://move-book.com/move-basics/primitive-types/](https://move-book.com/move-basics/primitive-types/)

## Commit

```bash
cd day_01
sui move test
git add day_01/
git commit -m "Day 1: setup package and module"
```

