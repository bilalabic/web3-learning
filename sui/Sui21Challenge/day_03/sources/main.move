/// DAY 3: Structs (Habit Model Skeleton)
/// 
/// Today you will:
/// 1. Learn about structs
/// 2. Create a Habit struct
/// 3. Write a constructor function

module challenge::day_03 {
    use std::vector;
    use std::string::{Self, String};

    // TODO: Define a struct called 'Habit' with:
    // - name: vector<u8> (we'll use String later)
    // - completed: bool
    // Add 'copy' and 'drop' abilities
    // public struct Habit has copy, drop {
    //     // Your fields here
    // }
    public struct Habit has copy, drop{
        name: vector<u8>,
        completed: bool
    }
    // TODO: Write a constructor function 'new_habit'
    // that takes a name (vector<u8>) and returns a Habit
    // public fun new_habit(name: vector<u8>): Habit {
    //     // Your code here
    // }
    public fun habit1(name: vector<u8>): Habit {
        Habit {
            name,
            completed: false,
        }
    }
    public struct Artist has copy, drop {
        name: String
    }
    public struct Album has copy, drop {
        title: String,
        artist: Artist
    }
    
    #[test]
    public fun test_album() {
        let artist = Artist { name: string::utf8(b"Pink Floyd") };
        let album1 = Album { title: string::utf8(b"The Dark Side of the Moon"), artist: artist };
        assert!(album1.title == string::utf8(b"The Dark Side of the Moon"), 0);
        assert!(album1.artist.name == string::utf8(b"Pink Floyd"), 1);
    }
}

