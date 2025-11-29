/// DAY 16: Introduce Object with UID & key
/// 
/// Today you will:
/// 1. Learn about UID (Unique Identifier)
/// 2. Learn about the 'key' ability
/// 3. Create your first Sui object
///
/// Note: You can copy code from day_15/sources/solution.move if needed

module challenge::day_16 {
    use sui::object::{Self, UID};
    use sui::tx_context::TxContext;

    // Copy from day_15: FarmCounters struct
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

    public fun plant(counters: &mut FarmCounters) {
        counters.planted = counters.planted + 1;
    }

    public fun harvest(counters: &mut FarmCounters) {
        counters.harvested = counters.harvested + 1;
    }

    // TODO: Define a struct called 'Farm' with:
    // - id: UID (this makes it a Sui object)
    // - counters: FarmCounters
    // Add 'key' ability (required for Sui objects)
    // public struct Farm has key {
    //     id: UID,
    //     counters: FarmCounters,
    // }

    // TODO: Write a constructor 'new_farm' that:
    // - Takes ctx: &mut TxContext
    // - Creates a UID using object::new(ctx)
    // - Returns a Farm with the UID and default counters
    // public fun new_farm(ctx: &mut TxContext): Farm {
    //     // Your code here
    //     // Hint: let id = object::new(ctx);
    // }
}

