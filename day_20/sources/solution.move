/// DAY 20: Events - SOLUTION
/// 
/// This is the solution file for day 20.
/// Students should complete main.move, not this file.

module challenge::day_20_solution {
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::event;
    use sui::tx_context::{TxContext, sender};

    // Copy Farm and all functions from day_19
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

    // Entry function to create an owned farm
    entry fun create_farm(ctx: &mut TxContext) {
        let farm = new_farm(ctx);
        transfer::transfer(farm, sender(ctx));
    }

    // Entry function to create a shared farm
    // Shared objects can be accessed by anyone on-chain
    entry fun create_shared_farm(ctx: &mut TxContext) {
        let farm = new_farm(ctx);
        transfer::share_object(farm);
    }

    public fun plant_on_farm(farm: &mut Farm) {
        plant(&mut farm.counters);
    }

    public fun harvest_from_farm(farm: &mut Farm) {
        harvest(&mut farm.counters);
    }

    public fun total_planted(farm: &Farm): u64 {
        farm.counters.planted
    }

    public fun total_harvested(farm: &Farm): u64 {
        farm.counters.harvested
    }

    // Event emitted when a crop is planted
    public struct PlantEvent has copy, drop {
        planted_after: u64,
    }

    // Entry function to plant with event emission
    entry fun plant_on_farm_entry(farm: &mut Farm) {
        plant_on_farm(farm);
        let planted_count = total_planted(farm);
        event::emit(PlantEvent {
            planted_after: planted_count,
        });
    }

    entry fun harvest_from_farm_entry(farm: &mut Farm) {
        harvest_from_farm(farm);
    }
}

