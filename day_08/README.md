# Day 8: New Module & Simple Task Struct

## What You'll Learn Today

Today you'll start a new project: **Task Bounty Board**. You'll learn:
- How to create a new module for a different project
- How to design a struct for tasks
- How to write constructor functions

## Understanding Project Organization

Each day builds on previous concepts, but sometimes we start fresh projects to practice different patterns. Today we're building a task management system.

## Your Task

1. Open `sources/main.move`
2. Define a `Task` struct with:
   - `title: String`
   - `reward: u64`
   - `done: bool`
3. Write a `new_task()` constructor function

## Reading Materials

1. **Modules** - Review module structure:
   [https://move-book.com/move-basics/module/](https://move-book.com/move-basics/module/)

2. **Structs** - Review struct definition:
   [https://move-book.com/move-basics/struct/](https://move-book.com/move-basics/struct/)

## Commit

```bash
cd day_08
sui move test
git add day_08/
git commit -m "Day 8: create bounty_board module and Task struct"
```

