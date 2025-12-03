/// DAY 10: Visibility Modifiers (Public vs Private Functions)
/// 
/// Today you will:
/// 1. Learn about visibility modifiers (public vs private)
/// 2. Design a public API
/// 3. Write a function to complete tasks
///
/// Note: You can copy code from day_09/sources/solution.move if needed

module challenge::day_10 {
    use std::string::String;

    // Copy from day_09: TaskStatus enum and Task struct
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

    // TODO: Write a public function 'complete_task' that:
    // - Takes task: &mut Task
    // - Sets task.status = TaskStatus::Completed
    // This should be public so users can call it
    // public fun complete_task(task: &mut Task) {
    //     // Your code here
    // }

    // TODO: (Optional) Write a private helper function
    // Private functions use 'fun' instead of 'public fun'
    // They can only be called from within the same module
}

