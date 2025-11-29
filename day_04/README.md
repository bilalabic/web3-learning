# Day 4: Vector + Ownership Basics

## What You'll Learn Today

Today you'll learn:
- What vectors are and how to use them
- Basic ownership concepts in Move
- How to create a list of habits

## Understanding Vectors

A **vector** is a list that can grow or shrink. It's like an array, but dynamic.

Basic vector operations:
- `vector::empty<T>()` - Create an empty vector
- `vector::push_back(&mut vec, item)` - Add an item to the end
- `vector::length(&vec)` - Get the number of items
- `vector::borrow(&vec, index)` - Get a read-only reference to an item
- `vector::borrow_mut(&mut vec, index)` - Get a mutable reference to an item

## Understanding Ownership

**Ownership** is a fundamental concept in Move. Every value has exactly one owner at a time.

When you pass a value to a function:
- **By value** (without `&`): You **transfer ownership** to the function
- **By reference** (`&` or `&mut`): You **borrow** the value (the function doesn't own it)

Examples:
```move
// Transfer ownership - 'habit' is moved into the function
add_habit(list, habit)  // After this, 'habit' can't be used anymore

// Borrow - 'list' is borrowed, not moved
add_habit(&mut list, habit)  // 'list' can still be used after this
```

**Key points:**
- `&` = read-only borrow
- `&mut` = mutable borrow (can modify)
- No `&` = transfer ownership (move)

## Your Task

1. Copy your `Habit` struct from day_03 into `sources/main.move`
2. Create a `HabitList` struct with a `vector<Habit>` field
3. Write `empty_list()` and `add_habit()` functions

## Reading Materials

1. **Vector** - Learn about vectors and their operations:
   [https://move-book.com/move-basics/vector/](https://move-book.com/move-basics/vector/)

2. **Ownership & Scope** - Understand ownership in Move:
   [https://move-book.com/move-basics/ownership-and-scope/](https://move-book.com/move-basics/ownership-and-scope/)

## Commit

```bash
cd day_04
sui move test
git add day_04/
git commit -m "Day 4: add HabitList and push habits into vector"
```

