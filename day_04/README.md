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

## Note: Using String for Text

**Important change from Day 3:**

In Day 3, you used `vector<u8>` for habit names. Starting from Day 4, we're using `String` instead!

```move
// Day 3 (old way)
name: vector<u8>

// Day 4 onwards (modern way)
name: String
```

**Why the change?**
- `String` is more readable and semantic
- Clearly indicates "this is text"
- Standard library provides String-specific functions
- This is the recommended way for new Move code

**Both work, but `String` is preferred.** You'll learn more about `String` in Day 6!

## Your Task

1. Copy your `Habit` struct from day_03 into `sources/main.move`
2. **Update it to use `String` instead of `vector<u8>`** (see `main.move` for example)
3. Create a `HabitList` struct with a `vector<Habit>` field
4. Write `empty_list()` and `add_habit()` functions

**Note:** The code in `sources/main.move` already uses `String` - you can follow that pattern!

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

