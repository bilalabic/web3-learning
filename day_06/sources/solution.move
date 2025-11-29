/// DAY 6: String Type for Habit Names - SOLUTION
/// 
/// This is the solution file for day 6.
/// Students should complete main.move, not this file.

module challenge::day_06_solution {
    use std::vector;
    use std::string::{Self, String};

    // Habit struct using String instead of vector<u8>
    public struct Habit has copy, drop {
        name: String,
        completed: bool,
    }

    // Constructor that accepts String
    public fun new_habit(name: String): Habit {
        Habit {
            name,
            completed: false,
        }
    }

    // Helper function to create a habit from bytes
    public fun make_habit(name_bytes: vector<u8>): Habit {
        let name = string::utf8(name_bytes);
        new_habit(name)
    }
}

