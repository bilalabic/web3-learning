/// DAY 19: Simple Query Functions - SOLUTION
/// 
/// This is the solution file for day 19.
/// Students should complete main.move, not this file.

module challenge::day_19_solution {
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{TxContext, sender};

    // Copy Farm and all functions from day_18
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

    entry fun plant_on_farm_entry(farm: &mut Farm) {
        plant_on_farm(farm);
    }

    entry fun harvest_from_farm_entry(farm: &mut Farm) {
        harvest_from_farm(farm);
    }

    // Get total planted count
    public fun total_planted(farm: &Farm): u64 {
        farm.counters.planted
    }

    // Get total harvested count
    public fun total_harvested(farm: &Farm): u64 {
        farm.counters.harvested
    }
}

