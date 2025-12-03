/// DAY 20: Events (Optional but Small)
/// 
/// Today you will:
/// 1. Learn about events
/// 2. Define an event struct
/// 3. Emit events when actions happen
///
/// Note: You can copy code from day_19/sources/solution.move if needed

module challenge::day_20 {
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::event;
    use sui::tx_context::{TxContext, sender};

    // Copy from day_19: All structs and functions
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

    public fun total_planted(farm: &Farm): u64 {
        farm.counters.planted
    }

    public fun total_harvested(farm: &Farm): u64 {
        farm.counters.harvested
    }

    // TODO: Define an event struct 'PlantEvent' with:
    // - planted_after: u64
    // Add 'copy' and 'drop' abilities
    // public struct PlantEvent has copy, drop {
    //     planted_after: u64,
    // }

    // TODO: Update plant_on_farm_entry to emit an event:
    // - After planting, get the new planted count
    // - Emit PlantEvent with event::emit()
    // entry fun plant_on_farm_entry(farm: &mut Farm) {
    //     // Your existing code
    //     // Then: event::emit(PlantEvent { planted_after: ... });
    // }

    // TODO: (Optional) Write an entry function 'create_shared_farm' that:
    // - Creates a new farm using new_farm(ctx)
    // - Makes it shared using transfer::share_object()
    // Shared objects can be accessed by anyone, not just the creator
    // entry fun create_shared_farm(ctx: &mut TxContext) {
    //     // Your code here
    // }
}

