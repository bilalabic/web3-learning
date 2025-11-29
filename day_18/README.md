# Day 18: Receiving Objects & Updating State

## What You'll Learn Today

Today you'll learn:
- How to write entry functions that receive objects
- How to update object state on-chain
- How objects are passed in transactions

## Understanding Object Parameters in Entry Functions

Entry functions can receive objects as parameters. When you call an entry function with an object:
- The object must be owned by the transaction sender
- The function receives a mutable reference (`&mut Object`)
- Changes to the object are persisted on-chain

## Your Task

1. The code from day_17 is already in `sources/main.move` (you can also check `day_17/sources/solution.move` if needed)
2. Write `entry fun plant_on_farm_entry()` that receives `&mut Farm`
3. Write `entry fun harvest_from_farm_entry()` that receives `&mut Farm`

## Reading Materials

1. **Receiving as Object** - Learn about object parameters:
   [https://move-book.com/storage/transfer-to-object](https://move-book.com/storage/transfer-to-object)

## Commit

```bash
cd day_18
sui move test
git add day_18/
git commit -m "Day 18: add entry functions to plant and harvest on Farm"
```

