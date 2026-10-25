/// DAY 1: Modules + Primitive Types - SOLUTION
///
/// This is the solution file for day 1.
/// Students should complete main.move, not this file.
///
/// To test this solution, temporarily rename main.move and use this file.

module challenge::day_01_solution {
    // Day 1: Basic module structure + primitive types

    // Constants in Move are defined at module level
    // They must be immutable and named in UPPERCASE

    const NUMBER: u64 = 42;           // 64-bit unsigned integer
    const FLAG: bool = true;          // Boolean
    const MY_ADDRESS: address = @0x1; // Blockchain address
}

