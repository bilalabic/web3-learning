# Day 14: Tests for Bounty Board

## What You'll Learn Today

Today you'll learn:
- How to write comprehensive tests
- How to test multiple functions together
- Best practices for test organization

## Understanding Test Coverage

Good tests cover:
- **Happy path** - Normal, expected usage
- **Edge cases** - Boundary conditions
- **Multiple functions** - How functions work together

## Your Task

1. The code from day_13 is already in `sources/main.move` (you can also check `day_13/sources/solution.move` if needed)
2. Write at least 3 tests:
   - Create board and add task
   - Complete a task and verify count
   - Calculate total reward

## Reading Materials

1. **Testing** - Review testing concepts:
   [https://move-book.com/move-basics/testing/](https://move-book.com/move-basics/testing/)

## Commit

```bash
cd day_14
sui move test
git add day_14/
git commit -m "Day 14: add unit tests for bounty board"
```

