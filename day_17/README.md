# Day 17: Ownership of Objects & Simple Entry Function

## What You'll Learn Today

Today you'll learn:
- How object ownership works
- What entry functions are
- How to transfer objects to users

## Understanding Entry Functions

An **entry function** is a function that can be called directly in a transaction. It's marked with the `entry` keyword:

```move
entry fun create_farm(ctx: &mut TxContext) {
    // This can be called from a transaction
}
```

Entry functions are the "public API" of your module - they're what users call to interact with your code.

## Understanding Object Transfer

When you create an object, you need to give it to someone. Use `transfer::transfer()`:

```move
transfer::transfer(farm, sender(ctx))
```

This transfers ownership of `farm` to the address that sent the transaction.

## Your Task

1. The code from day_16 is already in `sources/main.move` (you can also check `day_16/sources/solution.move` if needed)
2. Write an `entry fun create_farm()` that:
   - Creates a Farm
   - Transfers it to the sender
3. Write `plant_on_farm()` and `harvest_from_farm()` helper functions

## Reading Materials

1. **Ownership (objects)** - Learn about object ownership:
   [https://move-book.com/object/ownership/](https://move-book.com/object/ownership/)

2. **Transactions** - Understand entry functions:
   [https://move-book.com/concepts/what-is-a-transaction/](https://move-book.com/concepts/what-is-a-transaction/)

## Commit

```bash
cd day_17
sui move test
git add day_17/
git commit -m "Day 17: add Farm entry function and basic actions"
```

