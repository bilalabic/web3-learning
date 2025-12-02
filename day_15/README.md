# Day 15: Read Object Model & Create FarmState Struct

## What You'll Learn Today

Today you'll start your third project: **Farm Simulator**. You'll learn:
- What Sui objects are (conceptually)
- How to create a simple struct for counters
- Basic increment operations

## Understanding Sui Objects (Concept)

A **Sui object** is a special type of struct that:
- Can be owned by an address
- Can be transferred between addresses
- Has a unique ID (UID)
- Can be stored on-chain

**Today's Note:** We're NOT creating a Sui object yet! We're just creating a regular struct. We'll add UID and make it an object tomorrow.

## Farm Updates

The farm includes plotId support:
- **PlotId validation**: PlotIds must be between 1 and 20
- **Plot tracking**: A vector tracks all planted plots
- **Duplicate prevention**: Cannot plant the same plotId twice
- **Limit enforcement**: Maximum of 20 plots
- **Harvest validation**: Cannot harvest plots that don't exist

All functions now take `plotId: u8` parameters.

## Your Task

1. Open `sources/main.move`
2. Define constants for plotId validation and error codes
3. Define a `FarmCounters` struct with:
   - `planted: u64`
   - `harvested: u64`
   - `plots: vector<u8>`
4. Add `copy`, `drop`, and `store` abilities (store is needed for objects later)
5. Write `new_counters()`, `plant(plotId: u8)`, and `harvest(plotId: u8)` functions with plotId validation

## Reading Materials

1. **Object Model** - Learn about Sui objects conceptually:
   [https://move-book.com/object/](https://move-book.com/object/)

2. **What is an Object?** - Understand the concept:
   [https://move-book.com/object/object-model.html/](https://move-book.com/object/object-model.html/)

## Commit

```bash
cd day_15
sui move test
git add day_15/
git commit -m "Day 15: start farm_simulator with FarmCounters"
```

