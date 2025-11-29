# Day 13: Simple Aggregations (Total Reward, Completed Count)

## What You'll Learn Today

Today you'll learn:
- How to iterate over vectors
- How to calculate totals and counts
- How to filter data based on conditions

## Understanding Aggregations

**Aggregation** means collecting and summarizing data:
- **Sum** - Add up all values (total reward)
- **Count** - Count items that match a condition (completed tasks)

You'll use loops to:
1. Go through each item in a vector
2. Check a condition or get a value
3. Add to a running total or counter

## Your Task

1. The code from day_12 is already in `sources/main.move` (you can also check `day_12/sources/solution.move` if needed)
2. Write `total_reward()` that sums all task rewards
3. Write `completed_count()` that counts completed tasks

## Reading Materials

1. **Control Flow** - Review loops for iteration:
   [https://move-book.com/move-basics/control-flow/](https://move-book.com/move-basics/control-flow/)

## Commit

```bash
cd day_13
sui move test
git add day_13/
git commit -m "Day 13: add aggregations on TaskBoard"
```

