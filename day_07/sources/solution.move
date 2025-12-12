/// DAY 7: Unit Tests for Habit Tracker - SOLUTION
/// 
/// This is the solution file for day 7.
/// Students should complete main.move, not this file.

module challenge::day_07_solution {
    use std::vector;
    use std::string::{Self, String};

    // Copy final code from day_06
    public struct Habit has copy, drop {
        name: String,
        completed: bool,
    }

    public struct HabitList has drop {
        habits: vector<Habit>,
    }

    public fun new_habit(name: String): Habit {
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

    public fun complete_habit(list: &mut HabitList, index: u64) {
        let len = vector::length(&list.habits);
        if (index < len) {
            let habit = vector::borrow_mut(&mut list.habits, index);
            habit.completed = true;
        }
    }


    // Test: Create list and add habits
    #[test]
    fun test_add_habits() {
        let mut list = empty_list();
        // b"...".to_string() converts byte literals (b"...") to String
        // This is the standard way to create String values in Move
        let habit1 = new_habit(b"Exercise".to_string());
        let habit2 = new_habit(b"Read".to_string());
        
        add_habit(&mut list, habit1);
        add_habit(&mut list, habit2);
        
        let len = vector::length(&list.habits);
        assert!(len == 2, 0);
    }

    // Test: Complete a habit
    #[test]
    fun test_complete_habit() {
        let mut list = empty_list();
        let habit = new_habit(string::utf8(b"Exercise"));
        add_habit(&mut list, habit);
        
        complete_habit(&mut list, 0);
        
        let completed_habit = vector::borrow(&list.habits, 0);
        assert!(completed_habit.completed == true);
    }
}

