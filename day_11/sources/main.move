/// DAY 11: TaskBoard & Address Type
/// 
/// Today you will:
/// 1. Learn about the address type
/// 2. Create a TaskBoard that tracks ownership
/// 3. Understand ownership in practice
///
/// Note: You can copy code from day_10/sources/solution.move if needed
/// 
/// Related: Day 10 (Visibility), Day 12 (Building on TaskBoard)

module challenge::day_11 {
    use std::vector;
    use std::string::{Self, String};

    // Copy from day_10: TaskStatus enum and Task struct
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

    public fun complete_task(task: &mut Task) {
        task.status = TaskStatus::Completed;
    }

    // TODO: Define a struct called 'TaskBoard' with:
    // - owner: address (the address that owns this board)
    // - tasks: vector<Task>
    // Add 'drop' ability
    // public struct TaskBoard has drop {
    //     // Your fields here
    // }
    public struct TaskBoard has drop {
        owner: address,
        tasks: vector<Task>,
    }


    // TODO: Write a constructor 'new_board' that takes owner: address
    // and returns an empty TaskBoard
    // public fun new_board(owner: address): TaskBoard {
    //     // Your code here
    // }
    public fun new_board(owner: address): TaskBoard {
        TaskBoard {
            owner,
            tasks: vector::empty(),
        }
    }
    // TODO: Write a function 'add_task' that:
    // - Takes board: &mut TaskBoard and task: Task
    // - Adds the task to the board's vector
    // The task becomes part of the board's data
    // public fun add_task(board: &mut TaskBoard, task: Task) {
    //     // Your code here
    // }
    public fun add_task(board: &mut TaskBoard, task: Task) {
        vector::push_back(&mut board.tasks, task);
    }
    #[test]
    public fun test_task_board() {
        let owner_address = @0x8642264;
        let mut board = new_board(owner_address);
        let task1 = new_task(string::utf8(b"Collect 10 herbs"), 100);
        add_task(&mut board, task1);
        assert!(vector::length(&board.tasks) == 1);
    }
}

