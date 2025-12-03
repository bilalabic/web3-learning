/// DAY 17: Ownership of Objects & Simple Entry Function - SOLUTION
/// 
/// This is the solution file for day 17.
/// Students should complete main.move, not this file.

module challenge::day_17_solution {
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{TxContext, sender};

    // Copy Farm and FarmCounters from day_16
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
    // These are implementation details, not part of the public API
    fun plant(counters: &mut FarmCounters) {
        counters.planted = counters.planted + 1;
    }

    fun harvest(counters: &mut FarmCounters) {
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

    // Entry function to create a farm and transfer to sender
    entry fun create_farm(ctx: &mut TxContext) {
        let farm = new_farm(ctx);
        transfer::transfer(farm, sender(ctx));
    }

    // Plant on a farm (internal function)
    public fun plant_on_farm(farm: &mut Farm) {
        plant(&mut farm.counters);
    }

    // Harvest from a farm (internal function)
    public fun harvest_from_farm(farm: &mut Farm) {
        harvest(&mut farm.counters);
    }
}

