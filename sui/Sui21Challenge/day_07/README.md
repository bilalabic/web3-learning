# Day 7: Unit Tests for Habit Tracker

## What You'll Learn Today

Today you'll learn:
- How to write tests in Move
- How to use assertions
- How to organize your tests

## Understanding Tests

Tests in Move are functions marked with `#[test]`. They:
- Run when you execute `sui move test`
- Help verify your code works correctly
- Use assertions to check expected values

Common assertions:
- `assert!(condition)` - Check if condition is true (built-in macro)
- `assert_eq!(value1, value2)` - Check if two values are equal (from unit_test module)

**Note:** `assert!` is a built-in macro in Move 2024 edition, so you don't need to import it. Just use it directly!

## Test Organization

Good tests:
- Test one thing at a time
- Have clear names that describe what they test
- Use meaningful test data
- Check both success and failure cases

## Your Task

1. The code from day_06 is already in `sources/main.move` (you can also check `day_06/sources/solution.move` if needed)
2. Write at least 2 tests:
   - Test adding habits to a list
   - Test completing a habit

## Reading Materials

1. **Testing** - Learn how to write tests:
   [https://move-book.com/move-basics/testing/](https://move-book.com/move-basics/testing/)

## Commit

```bash
cd day_07
sui move test
git add day_07/
git commit -m "Day 7: add tests for habit tracker"
```

