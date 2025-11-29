/// DAY 15: Read Object Model & Create FarmState Struct - SOLUTION
/// 
/// This is the solution file for day 15.
/// Students should complete main.move, not this file.

module challenge::day_15_solution {
    // Simple counter struct (not a Sui object yet)
    public struct FarmCounters has copy, drop, store {
        planted: u64,
        harvested: u64,
    }

    // Create new counters with zeros
    public fun new_counters(): FarmCounters {
        FarmCounters {
            planted: 0,
            harvested: 0,
        }
    }

    // Increment planted counter
    public fun plant(counters: &mut FarmCounters) {
        counters.planted = counters.planted + 1;
    }

    // Increment harvested counter
    public fun harvest(counters: &mut FarmCounters) {
        counters.harvested = counters.harvested + 1;
    }
}

