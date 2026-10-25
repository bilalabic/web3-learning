# Day 5: Control Flow & Mark Habit as Done

## What You'll Learn Today

Today you'll learn:
- How to use if/else statements
- How to access vector elements
- How to modify struct fields

## Understanding Control Flow

**Control flow** lets your code make decisions and repeat actions:
- `if/else` - Make decisions based on conditions
- `while` - Repeat code while a condition is true
- `loop` - Repeat code forever (until break)

Basic syntax:
```move
if (condition) {
    // do something
} else {
    // do something else
}
```

## Understanding Vector Access

To access elements in a vector:
- `vector::length(&vec)` - Get the number of items
- `vector::borrow(&vec, index)` - Get a read-only reference (use `&`)
- `vector::borrow_mut(&mut vec, index)` - Get a mutable reference (use `&mut`)

**Important:** Always check if the index is valid before accessing!

## Your Task

1. Copy your code from day_04 into `sources/main.move`
2. Write a `complete_habit()` function that marks a habit as completed by index
3. Check if the index is valid before accessing

## Reading Materials

1. **Control Flow** - Learn if/else, while, and loops:
   [https://move-book.com/move-basics/control-flow/](https://move-book.com/move-basics/control-flow/)

## Commit

```bash
cd day_05
sui move test
git add day_05/
git commit -m "Day 5: add complete_habit with simple control flow"
```

