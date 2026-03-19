/// DAY 16: Introduce Object with UID & key
/// 
/// Today you will:
/// 1. Learn about UID (Unique Identifier)
/// 2. Learn about the 'key' ability
/// 3. Create your first Sui object
///
/// Note: The code includes plotId support. You can copy code from 
/// day_15/sources/solution.move if needed (note: plotId functionality has been added)

module challenge::day_16 {


    // Copy from day_15: FarmCounters struct
    use std::vector;
    use std::option::{Self,Option};

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
    
    fun new_counters(): FarmCounters {
        FarmCounters {
            planted: 0,
            harvested: 0,
            plots: vector::empty(),
        }
    }
    fun plant(counters: &mut FarmCounters, plotId: u8) {
        
        if (plotId == 0 || (plotId as u64) > MAX_PLOTS) {
            abort E_INVALID_PLOT_ID;
        };
        
        if (vector::contains(&counters.plots, &plotId)) {
            abort E_PLOT_ALREADY_EXISTS;
        };
        
        if (vector::length(&counters.plots) >= MAX_PLOTS) {
            abort E_PLOT_LIMIT_EXCEEDED;
        };
        
        vector::push_back(&mut counters.plots, plotId);
        counters.planted = counters.planted + 1;
    }

    fun harvest(counters: &mut FarmCounters, plotId: u8) {
        let (is_found, index) = vector::index_of(&counters.plots, &plotId);

        assert!(is_found, 1);
        
        vector::remove(&mut counters.plots, index);
        counters.harvested = counters.harvested + 1;

    }

    // TODO: Define a struct called 'Farm' with:
    // - id: UID (this makes it a Sui object)
    // - counters: FarmCounters
    // Add 'key' ability (required for Sui objects)
    // public struct Farm has key {
    //     id: UID,
    //     counters: FarmCounters,
    // }
    public struct Farm has key {
        id: UID,
        counters: FarmCounters,
    }
    // TODO: Write a constructor 'new_farm' that:
    // - Takes ctx: &mut TxContext
    // - Creates a UID using object::new(ctx)
    // - Returns a Farm with the UID and default counters
    // fun new_farm(ctx: &mut TxContext): Farm {
    //     // Your code here
    //     // Hint: let id = object::new(ctx);
    // }
    fun new_farm(ctx: &mut TxContext): Farm {
        Farm {
            id: object::new(ctx),
            counters: new_counters(),
        }
    }
}

