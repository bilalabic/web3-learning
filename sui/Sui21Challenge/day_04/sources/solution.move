/// DAY 4: Vector + Ownership Basics - SOLUTION
/// 
/// This is the solution file for day 4.
/// Students should complete main.move, not this file.

module challenge::day_04_solution {
    use std::vector;
    use std::string::String;

    // Copy the Habit struct from day_03
    public struct Habit has copy, drop {
        name: String,
        completed: bool,
    }

    public fun new_habit(name: String): Habit {
        Habit {
            name,
            completed: false,
        }
    }

    // HabitList struct containing a vector of habits
    public struct HabitList has drop {
        habits: vector<Habit>,
    }

    // Create an empty habit list
    public fun empty_list(): HabitList {
        HabitList {
            habits: vector::empty(),
        }
    }

    // Add a habit to the list (transfers ownership of habit)
    public fun add_habit(list: &mut HabitList, habit: Habit) {
        vector::push_back(&mut list.habits, habit);
    }
}

