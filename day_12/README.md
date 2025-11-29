# Day 12: Option for Task Lookup

## What You'll Learn Today

Today you'll learn:
- What `Option<T>` is and when to use it
- How to handle "maybe found, maybe not" situations
- How to return `Some(value)` or `None`

## Understanding Option

**Option** is a type that represents "maybe there's a value, maybe there isn't". It has two variants:
- `Some(value)` - There is a value
- `None` - There is no value

This is perfect for functions that might not find what they're looking for:
```move
fun find_task(...): Option<u64> {
    if (found) {
        option::some(index)  // Found it!
    } else {
        option::none()       // Not found
    }
}
```

## Your Task

1. The code from day_11 is already in `sources/main.move` (you can also check `day_11/sources/solution.move` if needed)
2. Write `find_task_by_title()` that:
   - Takes a board and a title
   - Returns `Option<u64>` (the index if found, None if not)
   - Loops through tasks to find a match

## Reading Materials

1. **Option** - Learn about Option type:
   [https://move-book.com/move-basics/option/](https://move-book.com/move-basics/option/)

## Commit

```bash
cd day_12
sui move test
git add day_12/
git commit -m "Day 12: add find_task_by_title using Option"
```

