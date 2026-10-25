# Day 6: String Type for Habit Names

## What You'll Learn Today

Today you'll learn:
- What the String type is
- How to convert vector<u8> to String
- How to use String in your structs

## Understanding String

A **String** is a type that represents text. In Move, String is built on top of `vector<u8>`, but it provides better functionality for working with text.

Key operations:
- `string::utf8(bytes)` - Convert `vector<u8>` to `String`
- `*&string` - Get a reference to the underlying bytes (if needed)

**Why use String instead of vector<u8>?**
- More semantic (clearly represents text)
- Better for readability
- Standard library provides String-specific functions

## Your Task

1. The code from day_05 is already in `sources/main.move` (you can also check `day_05/sources/solution.move` if needed)
2. Update `Habit` struct to use `String` instead of `vector<u8>` for the name field
3. Update `new_habit()` to accept `String`
4. Write a helper `make_habit()` that converts bytes to String

## Reading Materials

1. **String** - Learn about the String type:
   [https://move-book.com/move-basics/string/](https://move-book.com/move-basics/string/)

## Commit

```bash
cd day_06
sui move test
git add day_06/
git commit -m "Day 6: use String for habit names"
```

