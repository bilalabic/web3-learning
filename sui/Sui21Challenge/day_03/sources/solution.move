/// DAY 3: Structs (Habit Model Skeleton) - SOLUTION
/// 
/// This is the solution file for day 3.
/// Students should complete main.move, not this file.

module challenge::day_03_solution {
    use std::vector;

    // Habit struct with name and completed status
    public struct Habit has copy, drop {
        name: vector<u8>,
        completed: bool,
    }

    // Constructor function to create a new habit
    public fun new_habit(name: vector<u8>): Habit {
        Habit {
            name,
            completed: false,
        }
    }
}

