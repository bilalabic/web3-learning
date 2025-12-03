/// DAY 16: Introduce Object with UID & key - SOLUTION
/// 
/// This is the solution file for day 16.
/// Students should complete main.move, not this file.

module challenge::day_16_solution {
    use sui::object::{Self, UID};
    use sui::tx_context::TxContext;

    // Copy FarmCounters from day_15
    public struct FarmCounters has copy, drop, store {
        planted: u64,
        harvested: u64,
    }

    public fun new_counters(): FarmCounters {
        FarmCounters {
            planted: 0,
            harvested: 0,
        }
    }

    // Internal functions - only used within this module
    fun plant(counters: &mut FarmCounters) {
        counters.planted = counters.planted + 1;
    }

    fun harvest(counters: &mut FarmCounters) {
        counters.harvested = counters.harvested + 1;
    }

    // Farm object - a Sui object that can be owned
    public struct Farm has key {
        id: UID,
        counters: FarmCounters,
    }

    // Create a new Farm object
    public fun new_farm(ctx: &mut TxContext): Farm {
        Farm {
            id: object::new(ctx),
            counters: new_counters(),
        }
    }
}

