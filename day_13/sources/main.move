/// DAY 13: Simple Aggregations (Total Reward, Completed Count)
/// 
/// Today you will:
/// 1. Write functions that iterate over vectors
/// 2. Calculate totals and counts
/// 3. Practice with control flow
///
/// Note: You can copy code from day_12/sources/solution.move if needed

module challenge::day_13 {
    use std::vector;
    use std::string::String;
    use std::option::{Self, Option};

    // Copy from day_12: All structs and functions
    public enum TaskStatus has copy, drop {
        Open,
        Completed,
    }

    public struct Task has copy, drop {
        title: String,
        reward: u64,
        status: TaskStatus,
    }

    public struct TaskBoard has drop {
        owner: address,
        tasks: vector<Task>,
    }

    public fun new_task(title: String, reward: u64): Task {
        Task {
            title,
            reward,
            status: TaskStatus::Open,
        }
    }

    public fun new_board(owner: address): TaskBoard {
        TaskBoard {
            owner,
            tasks: vector::empty(),
        }
    }

    public fun add_task(board: &mut TaskBoard, task: Task) {
        vector::push_back(&mut board.tasks, task);
    }

    public fun find_task_by_title(board: &TaskBoard, title: &String): Option<u64> {
        let len = vector::length(&board.tasks);
        let mut i = 0;
        while (i < len) {
            let task = vector::borrow(&board.tasks, i);
            if (*&task.title == *title) {
                return option::some(i)
            };
            i = i + 1;
        };
        option::none()
    }

    // TODO: Write a function 'total_reward' that:
    // - Takes board: &TaskBoard
    // - Returns u64 (sum of all task rewards)
    // - Loops through all tasks and sums their rewards
    // public fun total_reward(board: &TaskBoard): u64 {
    //     // Your code here
    //     // Initialize total = 0
    //     // Loop through tasks, add each reward to total
    // }

    // TODO: Write a function 'completed_count' that:
    // - Takes board: &TaskBoard
    // - Returns u64 (count of completed tasks)
    // - Loops through tasks and counts those with status == Completed
    // public fun completed_count(board: &TaskBoard): u64 {
    //     // Your code here
    // }
}

