# Day 3: Structs (Habit Model Skeleton)

## What You'll Learn Today

Today you'll learn:
- What structs are and how to define them
- How to create custom data types
- How to write constructor functions

## Understanding Structs

A **struct** is a custom data type that groups related data together. Think of it as a container that holds multiple pieces of information.

For example, a `Habit` struct might contain:
- The habit's name
- Whether it's completed or not

Basic struct syntax:
```move
public struct Habit has copy, drop {
    name: vector<u8>,
    completed: bool,
}
```

## Understanding Abilities

Abilities tell Move what you can do with a type:
- `copy` - Can be copied
- `drop` - Can be discarded
- `store` - Can be stored in global storage (we'll learn this later)
- `key` - Can be used as a key in global storage (we'll learn this later)

For now, use `copy` and `drop` for simple structs.

## Understanding Constructor Functions

A **constructor** is a function that creates a new instance of a struct. It's a common pattern to name it `new_*`:

```move
public fun new_habit(name: vector<u8>): Habit {
    Habit {
        name,
        completed: false,
    }
}
```

## Your Task

1. Open `sources/main.move`
2. Define a `Habit` struct with `name: vector<u8>` and `completed: bool`
3. Write a `new_habit` constructor function

## Reading Materials

1. **Structs** - Learn how to define and use structs:
   [https://move-book.com/move-basics/struct/](https://move-book.com/move-basics/struct/)

2. **Abilities** - Understand copy, drop, store, key:
   [https://move-book.com/move-basics/abilities/](https://move-book.com/move-basics/abilities/)

## Commit

```bash
cd day_03
sui move test
git add day_03/
git commit -m "Day 3: add Habit struct and constructor"
```

