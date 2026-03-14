/// DAY 10: Visibility Modifiers (Public vs Private Functions)
/// 
/// Today you will:
/// 1. Learn about visibility modifiers (public vs private)
/// 2. Design a public API
/// 3. Write a function to complete tasks
///
/// Note: You can copy code from day_09/sources/solution.move if needed

module challenge::day_10 {
    use std::string::{Self, String};

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
    public fun complete_task(task: &mut Task) {
        task.status = TaskStatus::Completed;
    }
    // TODO: (Optional) Write a private helper function
    // Private functions use 'fun' instead of 'public fun'
    // They can only be called from within the same module
    // BONUS: Add a public function that calls your private helper
    //        (e.g. 'has_valid_reward' that internally calls 'internal_helper')

    fun internal_helper(task: &Task): bool {
        task.reward > 0
    }
    public fun has_valid_reward(task: &Task): bool {
        internal_helper(task)
    }
    #[test]
    public fun test_has_valid_reward() {
        let task1 = new_task(string::utf8(b"Collect 10 herbs"), 100);
        assert!(has_valid_reward(&task1));
    }

}

