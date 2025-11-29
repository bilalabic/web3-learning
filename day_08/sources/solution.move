/// DAY 8: New Module & Simple Task Struct - SOLUTION
/// 
/// This is the solution file for day 8.
/// Students should complete main.move, not this file.

module challenge::day_08_solution {
    use std::string::String;

    // Task struct with title, reward, and completion status
    public struct Task has copy, drop {
        title: String,
        reward: u64,
        done: bool,
    }

    // Constructor function to create a new task
    public fun new_task(title: String, reward: u64): Task {
        Task {
            title,
            reward,
            done: false,
        }
    }
}

