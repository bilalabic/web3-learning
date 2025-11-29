/// DAY 5: Control Flow & Mark Habit as Done
/// 
/// Today you will:
/// 1. Learn if/else statements
/// 2. Learn how to access vector elements
/// 3. Write a function to mark a habit as completed

module challenge::day_05 {
    use std::vector;

    // Copy from day_04
    public struct Habit has copy, drop {
        name: vector<u8>,
        completed: bool,
    }

    public struct HabitList has drop {
        habits: vector<Habit>,
    }

    public fun new_habit(name: vector<u8>): Habit {
        Habit {
            name,
            completed: false,
        }
    }

    public fun empty_list(): HabitList {
        HabitList {
            habits: vector::empty(),
        }
    }

    public fun add_habit(list: &mut HabitList, habit: Habit) {
        vector::push_back(&mut list.habits, habit);
    }

    // TODO: Write a function 'complete_habit' that:
    // - Takes list: &mut HabitList and index: u64
    // - Checks if index is valid (less than vector length)
    // - If valid, marks that habit's completed field as true
    // Use vector::length() to get the length
    // Use vector::borrow_mut() to get a mutable reference to an element
    // public fun complete_habit(list: &mut HabitList, index: u64) {
    //     // Your code here
    //     // Hint: if (index < length) { ... }
    // }
}

