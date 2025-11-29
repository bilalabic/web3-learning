# Day 20: Events

## What You'll Learn Today

Today you'll learn:
- What events are and why they're useful
- How to define an event struct
- How to emit events

## Understanding Events

**Events** are messages that your code can send when something happens. They:
- Are stored on-chain
- Can be queried by clients
- Help track what happened in transactions

Common use cases:
- Logging important actions
- Notifying external systems
- Building transaction history

## Your Task

1. The code from day_19 is already in `sources/main.move` (you can also check `day_19/sources/solution.move` if needed)
2. Define a `PlantEvent` struct with `planted_after: u64`
3. Update `plant_on_farm_entry()` to emit the event after planting

## Reading Materials

1. **Events** - Learn about events:
   [https://move-book.com/programmability/events/](https://move-book.com/programmability/events/)

## Commit

```bash
cd day_20
sui move test
git add day_20/
git commit -m "Day 20: emit simple PlantEvent when planting"
```

