/// DAY 12: Option for Task Lookup
/// 
/// Today you will:
/// 1. Learn about Option<T> type
/// 2. Write a function to find tasks by title
/// 3. Handle the case when task is not found
///
/// Note: You can copy code from day_11/sources/solution.move if needed

module challenge::day_12 {
    use std::vector;
    use std::string::String;
    use std::option::{Self, Option};

    // Copy from day_11: TaskStatus, Task, and TaskBoard
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

    // TODO: Write a function 'find_task_by_title' that:
    // - Takes board: &TaskBoard and title: &String
    // - Returns Option<u64> (the index if found, None if not found)
    // - Loops through tasks and compares titles
    // public fun find_task_by_title(board: &TaskBoard, title: &String): Option<u64> {
    //     // Your code here
    //     // Use a while loop to iterate
    //     // Use option::some(index) if found
    //     // Use option::none() if not found
    // }
}

