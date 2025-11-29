/// DAY 18: Receiving Objects & Updating State
/// 
/// Today you will:
/// 1. Write entry functions that receive objects
/// 2. Update object state on-chain
/// 3. Understand how objects are passed in transactions
///
/// Note: You can copy code from day_17/sources/solution.move if needed

module challenge::day_18 {
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{TxContext, sender};

    // Copy from day_17: All structs and functions
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

    // TODO: Write an entry function 'plant_on_farm_entry' that:
    // - Takes farm: &mut Farm
    // - Calls plant_on_farm(farm)
    // entry fun plant_on_farm_entry(farm: &mut Farm) {
    //     // Your code here
    // }

    // TODO: Write an entry function 'harvest_from_farm_entry' that:
    // - Takes farm: &mut Farm
    // - Calls harvest_from_farm(farm)
    // entry fun harvest_from_farm_entry(farm: &mut Farm) {
    //     // Your code here
    // }
}

