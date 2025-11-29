/// DAY 19: Simple Query Functions (View-like)
/// 
/// Today you will:
/// 1. Write read-only functions
/// 2. Query object state
/// 3. Write tests for query functions
///
/// Note: You can copy code from day_18/sources/solution.move if needed

module challenge::day_19 {
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{TxContext, sender};

    // Copy from day_18: All structs and functions
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

    public struct Farm has key {
        id: UID,
        counters: FarmCounters,
    }

    public fun new_farm(ctx: &mut TxContext): Farm {
        Farm {
            id: object::new(ctx),
            counters: new_counters(),
        }
    }

    entry fun create_farm(ctx: &mut TxContext) {
        let farm = new_farm(ctx);
        transfer::transfer(farm, sender(ctx));
    }

    public fun plant_on_farm(farm: &mut Farm) {
        plant(&mut farm.counters);
    }

    public fun harvest_from_farm(farm: &mut Farm) {
        harvest(&mut farm.counters);
    }

    entry fun plant_on_farm_entry(farm: &mut Farm) {
        plant_on_farm(farm);
    }

    entry fun harvest_from_farm_entry(farm: &mut Farm) {
        harvest_from_farm(farm);
    }

    // TODO: Write a function 'total_planted' that:
    // - Takes farm: &Farm (read-only reference)
    // - Returns u64 (the planted count)
    // public fun total_planted(farm: &Farm): u64 {
    //     // Your code here
    // }

    // TODO: Write a function 'total_harvested' that:
    // - Takes farm: &Farm
    // - Returns u64 (the harvested count)
    // public fun total_harvested(farm: &Farm): u64 {
    //     // Your code here
    // }

    // TODO: (Optional) Write a test that:
    // - Creates a farm
    // - Plants once
    // - Checks that total_planted returns 1
}

