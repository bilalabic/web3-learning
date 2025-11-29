/// DAY 9: Enums & TaskStatus - SOLUTION
/// 
/// This is the solution file for day 9.
/// Students should complete main.move, not this file.

module challenge::day_09_solution {
    use std::string::String;

    // Task status enum
    public enum TaskStatus has copy, drop {
        Open,
        Completed,
    }

    // Task struct using TaskStatus instead of bool
    public struct Task has copy, drop {
        title: String,
        reward: u64,
        status: TaskStatus,
    }

    // Constructor that sets status to Open
    public fun new_task(title: String, reward: u64): Task {
        Task {
            title,
            reward,
            status: TaskStatus::Open,
        }
    }

    // Check if a task is open
    public fun is_open(task: &Task): bool {
        task.status == TaskStatus::Open
    }
}

