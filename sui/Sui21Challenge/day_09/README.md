# Day 9: Enums & TaskStatus

## What You'll Learn Today

Today you'll learn:
- What enums are and when to use them
- How to replace boolean flags with enums
- How to check enum values

## Understanding Enums

An **enum** (enumeration) is a type that can be one of several variants. It's perfect for representing states or categories.

Instead of using `bool` for "done or not done", we can use an enum:
```move
enum TaskStatus {
    Open,      // Task is available
    Completed, // Task is finished
}
```

This is better because:
- More readable (status == Open vs done == false)
- Easier to extend (can add more statuses later)
- Type-safe (can't accidentally use wrong value)

## Your Task

1. Copy your `Task` struct from day_08 into `sources/main.move`
2. Define a `TaskStatus` enum with `Open` and `Completed` variants
3. Update `Task` to use `status: TaskStatus` instead of `done: bool`
4. Write an `is_open()` function

## Reading Materials

1. **Enums & Match** - Learn about enums and pattern matching:
   [https://move-book.com/move-basics/enum-and-match/](https://move-book.com/move-basics/enum-and-match/)

## Commit

```bash
cd day_09
sui move test
git add day_09/
git commit -m "Day 9: add TaskStatus enum and status helpers"
```

