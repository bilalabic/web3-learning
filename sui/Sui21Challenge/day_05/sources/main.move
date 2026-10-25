/// DAY 5: Control Flow & Mark Habit as Done
/// 
/// Today you will:
/// 1. Learn if/else statements
/// 2. Learn how to access vector elements
/// 3. Write a function to mark a habit as completed

module challenge::day_05 {
    use std::vector;

    const EIndex: u64 = 0;
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

    public fun complete_habit(habits: &mut HabitList, index: u64) {
        
        let len = vector::length(&mut habits.habits);

        if (index >= len) {
            abort(EIndex); //Error: Index not found
        } ;

        let habit_to_complete = vector::borrow_mut(&mut habits.habits, index);

        habit_to_complete.completed = true;
    }
    
    #[test]
    fun test_complete_habit_basarili() {
        let mut my_list = empty_list();
        let habit1 = Habit { name: b"Write code", completed: false };
        let habit2 = Habit { name: b"Using AI", completed: false };
        let habit3 = Habit { name: b"Striving for financial independence", completed: false };
        let habit4 = Habit { name: b"I'm visualizing everything in my mind.", completed: false };
        add_habit(&mut my_list, habit1);
        add_habit(&mut my_list, habit2);
        add_habit(&mut my_list, habit3);
        add_habit(&mut my_list, habit4);    
        
        complete_habit(&mut my_list, 2);

        assert!(my_list.habits[2].completed == true, 100);
        assert!(my_list.habits[1].completed == false, 101);
}
}

