/// DAY 18: Receiving Objects & Updating State - SOLUTION
/// 
/// This is the solution file for day 18.
/// Students should complete main.move, not this file.

module challenge::day_18_solution {
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{TxContext, sender};

    // Copy Farm and all functions from day_17
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

    // Entry function to plant on a farm
    // Note: This works with owned objects (objects you own)
    // For shared objects, the signature would be the same, but the object
    // would need to be created as shared using transfer::share_object()
    entry fun plant_on_farm_entry(farm: &mut Farm) {
        plant_on_farm(farm);
    }

    // Entry function to harvest from a farm
    // Same note: works with owned objects
    // Shared objects can also use the same signature
    entry fun harvest_from_farm_entry(farm: &mut Farm) {
        harvest_from_farm(farm);
    }
}

