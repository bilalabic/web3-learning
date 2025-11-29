/// DAY 21: Final Tests & Cleanup
/// 
/// Today you will:
/// 1. Write comprehensive tests for the farm
/// 2. Clean up your code
/// 3. Review what you've learned
///
/// Note: You can copy code from day_20/sources/solution.move if needed

module challenge::day_21 {
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::event;
    use sui::tx_context::{TxContext, sender};

    #[test_only]
    use std::unit_test::assert_eq;
    // Note: test_scenario is available in Sui framework for testing
    // You'll need to import it when writing tests: use sui::test_scenario;

    // Copy from day_20: All structs and functions
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

    public struct PlantEvent has copy, drop {
        planted_after: u64,
    }

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

    // TODO: Write comprehensive tests:
    // 
    // Test 1: test_create_farm
    // - Create a farm
    // - Check initial counters are zero
    // 
    // Test 2: test_planting_increases_counter
    // - Create farm, plant once
    // - Verify planted counter is 1
    // 
    // Test 3: test_harvesting_increases_counter
    // - Create farm, harvest once
    // - Verify harvested counter is 1
    // 
    // Test 4: test_multiple_operations
    // - Plant 3 times, harvest 2 times
    // - Verify both counters are correct
    // 
    // Use test_scenario::begin, test_scenario::next_tx, etc.
    // See day_17-19 for examples of test_scenario usage

    // TODO: Review all three projects (habit_tracker, bounty_board, farm_simulator)
    // Make sure function names are consistent
    // Remove any unnecessary comments
    // Ensure all tests pass
}

