/// DAY 17: Ownership of Objects & Simple Entry Function
/// 
/// Today you will:
/// 1. Learn about object ownership
/// 2. Write your first entry function
/// 3. Transfer objects to users
///
/// Note: You can copy code from day_16/sources/solution.move if needed

module challenge::day_17 {
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{TxContext, sender};

    // Copy from day_16: FarmCounters and Farm
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

    // TODO: Write an entry function 'create_farm' that:
    // - Takes ctx: &mut TxContext
    // - Creates a Farm using new_farm
    // - Transfers it to the sender using transfer::transfer(farm, sender(ctx))
    // entry fun create_farm(ctx: &mut TxContext) {
    //     // Your code here
    // }

    // TODO: Write a function 'plant_on_farm' that:
    // - Takes farm: &mut Farm
    // - Calls plant() on farm.counters
    // public fun plant_on_farm(farm: &mut Farm) {
    //     // Your code here
    // }

    // TODO: Write a function 'harvest_from_farm' that:
    // - Takes farm: &mut Farm
    // - Calls harvest() on farm.counters
    // public fun harvest_from_farm(farm: &mut Farm) {
    //     // Your code here
    // }
}

