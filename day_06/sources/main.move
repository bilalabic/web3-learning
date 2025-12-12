/// DAY 6: String Type for Habit Names
/// 
/// Today you will:
/// 1. Learn about the String type
/// 2. Convert vector<u8> to String
/// 3. Update Habit to use String instead of vector<u8>
///
/// Note: You can copy code from day_05/sources/solution.move if needed

module challenge::day_06 {
    use std::vector;
    use std::string::{Self, String};

    // Copy from day_05: Habit struct (will be updated to use String)
    public struct Habit has copy, drop {
        name: vector<u8>,  // TODO: Change this to String
        completed: bool,
    }

    public fun new_habit(name: vector<u8>): Habit {
        Habit {
            name,
            completed: false,
        }
    }

    // Copy from day_05: HabitList struct
    public struct HabitList has drop {
        habits: vector<Habit>,
    }

    public fun empty_list(): HabitList {
        HabitList {
            habits: vector::empty(),
        }
    }

    public fun add_habit(list: &mut HabitList, habit: Habit) {
        vector::push_back(&mut list.habits, habit);
    }

    public fun complete_habit(list: &mut HabitList, index: u64) {
        let len = vector::length(&list.habits);
        if (index < len) {
            let habit = vector::borrow_mut(&mut list.habits, index);
            habit.completed = true;
        }
    }

    // TODO: Update Habit struct to use String instead of vector<u8>
    // Note: String is the preferred type for text data in Move.
    // You can use String directly - no need to work with vector<u8>!
    // public struct Habit has copy, drop {
    //     name: String,  // Changed from vector<u8> - String is better!
    //     completed: bool,
    // }

    // TODO: Update new_habit to accept String
    // public fun new_habit(name: String): Habit {
    //     // Your code here
    // }

    // TODO: Write a helper function 'make_habit' that:
    // - Takes name_bytes: vector<u8> (by value, not reference)
    // - Converts it to String using string::utf8()
    // - Creates and returns a Habit
    // public fun make_habit(name_bytes: vector<u8>): Habit {
    //     // Your code here
    //     // Hint: let name = string::utf8(name_bytes);
    // }
}

