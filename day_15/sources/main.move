/// DAY 15: Read Object Model & Create FarmState Struct (no UID yet)
/// 
/// Today you will:
/// 1. Learn about Sui objects (conceptually)
/// 2. Create a simple struct for farm counters
/// 3. Write basic functions to increment counters
/// 
/// NOTE: Today we're NOT creating a Sui object yet, just a regular struct.
/// We'll add UID and make it an object tomorrow.

module challenge::day_15 {
    // TODO: Define a struct called 'FarmCounters' with:
    // - planted: u64
    // - harvested: u64
    // Add 'copy', 'drop', and 'store' abilities
    // (store is needed because we'll put this in an object later)
    // public struct FarmCounters has copy, drop, store {
    //     // Your fields here
    // }

    // TODO: Write a constructor 'new_counters' that returns counters with zeros
    // public fun new_counters(): FarmCounters {
    //     // Your code here
    // }

    // TODO: Write a function 'plant' that increments planted counter
    // public fun plant(counters: &mut FarmCounters) {
    //     // Your code here
    // }

    // TODO: Write a function 'harvest' that increments harvested counter
    // public fun harvest(counters: &mut FarmCounters) {
    //     // Your code here
    // }
}

