/// DAY 10: Visibility Modifiers (Public vs Private Functions) - SOLUTION
/// 
/// This is the solution file for day 10.
/// Students should complete main.move, not this file.

module challenge::day_10_solution {
    use std::string::String;

    // Copy Task and TaskStatus from day_09
    public enum TaskStatus has copy, drop {
        Open,
        Completed,
    }

    public struct Task has copy, drop {
        title: String,
        reward: u64,
        status: TaskStatus,
    }

    public fun new_task(title: String, reward: u64): Task {
        Task {
            title,
            reward,
            status: TaskStatus::Open,
        }
    }

    public fun is_open(task: &Task): bool {
        task.status == TaskStatus::Open
    }

    // Public function - users can call this
    public fun complete_task(task: &mut Task) {
        task.status = TaskStatus::Completed;
    }

    // Private helper function (example)
    // This function can only be called from within this module
    // It's useful for internal logic that shouldn't be exposed publicly
    fun internal_helper(task: &Task): bool {
        // Example: Internal validation logic
        // Only this module can call this, not external users
        task.reward > 0
    }
}

