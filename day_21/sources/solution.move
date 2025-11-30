/// DAY 21: Final Tests & Cleanup - SOLUTION
/// 
/// This is the solution file for day 21.
/// Students should complete main.move, not this file.

module challenge::day_21_solution {
    use sui::object::{Self, UID};
    use sui::event;
    use sui::tx_context::{TxContext, sender};

    #[test_only]
    use std::unit_test::assert_eq;
    #[test_only]
    use sui::test_scenario;

    // Copy all code from day_20
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

    // Test: Create farm and check initial state
    #[test]
    fun test_create_farm() {
        let mut scenario = test_scenario::begin(@0x1);
        {
            create_farm(test_scenario::ctx(&mut scenario));
        };
        test_scenario::next_tx(&mut scenario, @0x1);
        {
            let farm = test_scenario::take_from_sender<Farm>(&scenario);
            assert_eq!(total_planted(&farm), 0);
            assert_eq!(total_harvested(&farm), 0);
            test_scenario::return_to_sender(&scenario, farm);
        };
        test_scenario::end(scenario);
    }

    // Test: Planting increases counter
    #[test]
    fun test_planting_increases_counter() {
        let mut scenario = test_scenario::begin(@0x1);
        {
            create_farm(test_scenario::ctx(&mut scenario));
        };
        test_scenario::next_tx(&mut scenario, @0x1);
        {
            let mut farm = test_scenario::take_from_sender<Farm>(&scenario);
            plant_on_farm(&mut farm);
            assert_eq!(total_planted(&farm), 1);
            assert_eq!(total_harvested(&farm), 0);
            test_scenario::return_to_sender(&scenario, farm);
        };
        test_scenario::end(scenario);
    }

    // Test: Harvesting increases counter
    #[test]
    fun test_harvesting_increases_counter() {
        let mut scenario = test_scenario::begin(@0x1);
        {
            create_farm(test_scenario::ctx(&mut scenario));
        };
        test_scenario::next_tx(&mut scenario, @0x1);
        {
            let mut farm = test_scenario::take_from_sender<Farm>(&scenario);
            // Plant first
            plant_on_farm(&mut farm);
            // Then harvest
            harvest_from_farm(&mut farm);
            assert_eq!(total_planted(&farm), 1);
            assert_eq!(total_harvested(&farm), 1);
            test_scenario::return_to_sender(&scenario, farm);
        };
        test_scenario::end(scenario);
    }

    // Test: Multiple operations
    #[test]
    fun test_multiple_operations() {
        let mut scenario = test_scenario::begin(@0x1);
        {
            create_farm(test_scenario::ctx(&mut scenario));
        };
        test_scenario::next_tx(&mut scenario, @0x1);
        {
            let mut farm = test_scenario::take_from_sender<Farm>(&scenario);
            // Plant 3 times
            plant_on_farm(&mut farm);
            plant_on_farm(&mut farm);
            plant_on_farm(&mut farm);
            // Harvest 2 times
            harvest_from_farm(&mut farm);
            harvest_from_farm(&mut farm);
            
            assert_eq!(total_planted(&farm), 3);
            assert_eq!(total_harvested(&farm), 2);
            test_scenario::return_to_sender(&scenario, farm);
        };
        test_scenario::end(scenario);
    }
}

