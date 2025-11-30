/// DAY 21: Final Tests & Cleanup
/// 
/// Today you will:
/// 1. Write comprehensive tests for the farm
/// 2. Clean up your code
/// 3. Review what you've learned
///
/// Note: You can copy code from day_20/sources/solution.move if needed

module challenge::day_21 {
    use sui::event;
 

    #[test_only]
    use std::unit_test::assert_eq;
    // Note: test_scenario is available in Sui framework for testing
    // You'll need to import it when writing tests: use sui::test_scenario;

    // Copy from day_20: All structs and functions
    
    const MAX_PLOTS: u64 = 20;
    const E_PLOT_NOT_FOUND: u64 = 1;
    const E_PLOT_LIMIT_EXCEEDED: u64 = 2;
    const E_INVALID_PLOT_ID: u64 = 3;
    const E_PLOT_ALREADY_EXISTS: u64 = 4;
    

    public struct FarmCounters has copy, drop, store {
        planted: u64,
        harvested: u64,
        plots: vector<u8>,
    }

    public fun new_counters(): FarmCounters {
        FarmCounters {
            planted: 0,
            harvested: 0,
            plots: vector::empty(),
        }
    }

    public fun plant(counters: &mut FarmCounters, plotId: u8) {
        // Check if plotId is valid (between 1 and 20)
        assert!(plotId >= 1 && plotId <= (MAX_PLOTS as u8), E_INVALID_PLOT_ID);
        
        // Check if we've reached the plot limit
        let len = vector::length(&counters.plots);
        assert!(len < MAX_PLOTS, E_PLOT_LIMIT_EXCEEDED);
        
        // Check if plot already exists in the vector
        let mut i = 0;
        while (i < len) {
            let existing_plot = vector::borrow(&counters.plots, i);
            assert!(*existing_plot != plotId, E_PLOT_ALREADY_EXISTS);
            i = i + 1;
        };
        
        counters.planted = counters.planted + 1;
        vector::push_back(&mut counters.plots, plotId);
    }

    public fun harvest(counters: &mut FarmCounters, plotId: u8) {
        let len = vector::length(&counters.plots);
                
        // Check if plot exists in the vector and find its index
        let mut i = 0;
        let mut found_index = len; 
        while (i < len) {
            let existing_plot = vector::borrow(&counters.plots, i);
            if (*existing_plot == plotId) {
                found_index = i;
            };
            i = i + 1;
        };
        
        // Assert that plot was found (found_index < len means we found it)
        assert!(found_index < len, E_PLOT_NOT_FOUND);
        
        // Remove the plot from the vector
        vector::remove(&mut counters.plots, found_index);
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
        transfer::transfer(farm, ctx.sender());
    }

    public fun plant_on_farm(farm: &mut Farm, plotId: u8) {
        plant(&mut farm.counters, plotId);
    }

    public fun harvest_from_farm(farm: &mut Farm, plotId: u8) {
        harvest(&mut farm.counters, plotId);
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

    entry fun plant_on_farm_entry(farm: &mut Farm, plotId: u8) {
        plant_on_farm(farm, plotId);
        let planted_count = total_planted(farm);
        event::emit(PlantEvent {
            planted_after: planted_count,
        });
    }

    entry fun harvest_from_farm_entry(farm: &mut Farm, plotId: u8) {
        harvest_from_farm(farm, plotId);
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

