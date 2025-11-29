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

## Your Task

1. Open `sources/main.move`
2. The module is already set up - just verify it builds
3. Build and test: `sui move build` and `sui move test`



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

