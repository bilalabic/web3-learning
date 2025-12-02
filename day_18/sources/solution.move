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

    fun new_counters(): FarmCounters {
        FarmCounters {
            planted: 0,
            harvested: 0,
        }
    }

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

    fun new_farm(ctx: &mut TxContext): Farm {
        Farm {
            id: object::new(ctx),
            counters: new_counters(),
        }
    }

    entry fun create_farm(ctx: &mut TxContext) {
        let farm = new_farm(ctx);
        transfer::transfer(farm, sender(ctx));
    }

    fun plant_on_farm(farm: &mut Farm) {
        plant(&mut farm.counters);
    }

    fun harvest_from_farm(farm: &mut Farm) {
        harvest(&mut farm.counters);
    }

    // Entry function to plant on a farm
    entry fun plant_on_farm_entry(farm: &mut Farm) {
        plant_on_farm(farm);
    }

    // Entry function to harvest from a farm
    entry fun harvest_from_farm_entry(farm: &mut Farm) {
        harvest_from_farm(farm);
    }
}

