# Move & Sui Glossary

A quick reference guide for all the terms you'll encounter in this challenge.

---

## A

### Ability

Capabilities that tell Move what operations are allowed on a type.

**The four abilities:**

- `copy` - Value can be copied
- `drop` - Value can be discarded/deleted
- `store` - Value can be stored inside other structs
- `key` - Value can be a object (needs `id: UID`)

**Example:**

```move
public struct MyStruct has copy, drop, store {
    field: u64
}
```

**Where you'll use it:** Day 3 (structs), Day 16 (objects)

---

### Address

A type representing a blockchain address (like an account ID).

**Format:** `0x` followed by hexadecimal digits (0-9, a-f)

**Example:**

```move
let owner: address = @0x1;
let user: address = @0xA1B2C3D4;
```

**Where you'll use it:** Day 11 (TaskBoard)

---

### Assert

A way to check conditions in tests. If the condition is false, the test fails.

**Examples:**

```move
assert!(x > 0, error_code);         // Check condition
assert_eq!(result, expected);      // Check equality
```

**Where you'll use it:** Day 2 (first test), Day 7 (comprehensive tests)

---

## B

### Borrow

Temporarily accessing a value without taking ownership.

**Two types:**

- `&T` - Immutable borrow (read-only)
- `&mut T` - Mutable borrow (can modify)

**Example:**

```move
add_habit(&mut list, habit);  // Borrow list mutably
let len = length(&list);      // Borrow list immutably
```

**Where you'll use it:** Day 4 (ownership), used throughout

---

### Build

Compiling your Move code into bytecode that Sui can execute.

**Command:** `sui move build`

**What it does:** Checks syntax, type safety, and generates executable code.

---

## C

### Constructor

A function that creates a new instance of a struct.

**Convention:** Usually named `new_*` or `create_*`

**Example:**

```move
public fun new_habit(name: String): Habit {
    Habit {
        name,
        completed: false,
    }
}
```

**Where you'll use it:** Day 3 (Habit constructor), used throughout

---

## D

### Drop

An ability that allows a value to be discarded or destroyed.

**Without drop:** Values must be explicitly consumed or returned.
**With drop:** Values can be ignored or go out of scope.

**Example:**

```move
public struct CanDrop has drop {
    value: u64
}

fun example() {
    let x = CanDrop { value: 5 };
    // x is dropped automatically at end of function
}
```

**Where you'll use it:** Day 3 onwards (most structs need this)

---

## E

### Entry Function

A function that can be called directly from transactions/explorers.

**Requirements:**

- Marked with `entry` keyword
- Can only be at module level
- Often takes `&mut TxContext` as last parameter

**Example:**

```move
entry fun create_farm(ctx: &mut TxContext) {
    let farm = Farm { id: object::new(ctx), ... };
    transfer::transfer(farm, ctx.sender());
}
```

**Where you'll use it:** Day 17-21 (Sui objects and transactions)

---

### Enum

A type that can be one of several variants.

**Example:**

```move
public enum TaskStatus has copy, drop {
    Open,
    Completed,
}
```

**Where you'll use it:** Day 9 (TaskStatus)

---

### Event

A message emitted during execution that can be queried later.

**Example:**

```move
public struct PlantEvent has copy, drop {
    planted_after: u64
}

// Emit the event
event::emit(PlantEvent { planted_after: 5 });
```

**Where you'll use it:** Day 20 (events)

---

## F

### Function

A named block of code that performs a specific task.

**Types:**

- `fun` - Private (module only)
- `public fun` - Can be called from other modules
- `entry fun` - Can be called from explorers

**Example:**

```move
public fun add(a: u64, b: u64): u64 {
    a + b
}
```

**Where you'll use it:** Day 2 onwards (everywhere!)

---

## K

### Key

An ability that allows a struct to be a Sui object.

**Requirements:**

- Must have `id: UID` field
- Can be owned and transferred
- Can be stored on-chain

**Example:**

```move
public struct Farm has key {
    id: UID,
    counters: FarmCounters,
}
```

**Where you'll use it:** Day 16 (first Sui object)

---

## M

### Module

A container for Move code. Like a file or package in other languages.

**Structure:**

```move
module package_name::module_name {
    // structs, functions, etc.
}
```

**Example:**

```move
module challenge::day_01 {
    // Your code here
}
```

**Where you'll use it:** Day 1 onwards (every day has a module)

---

### Move

The programming language you're learning! Designed for safe asset management on blockchain.

**Key features:**

- Object-centric
- Type-safe

---

### Mutable

Can be changed/modified.

**Usage:**

- Variables: `let mut x = 5;` (can be reassigned)
- References: `&mut T` (can modify the borrowed value)

**Example:**

```move
let mut counter = 0;
counter = counter + 1;  // OK, counter is mutable

add_habit(&mut list, habit);  // Mutable borrow
```

---

## O

### Object

In Sui, a struct with `key` ability and a `UID` field.

**Properties:**

- Stored on-chain
- Can be owned by addresses (or other ownership models)
- Can be transferred
- Has a unique ID

**Example:**

```move
public struct Farm has key {
    id: UID,
    planted: u64,
}
```

**Where you'll use it:** Day 15-21 (Sui objects)

---

### Option

A type that represents "maybe has a value, maybe doesn't".

**Variants:**

- `Some(value)` - Has a value
- `None` - No value

**Example:**

```move
let maybe_index: Option<u64> = option::some(5);
let nothing: Option<u64> = option::none();
```

**Where you'll use it:** Day 12 (finding tasks)

---

### Ownership

Every value in Move has exactly one owner. When ownership transfers (moves), the original owner can't use it anymore.

**Example:**

```move
let habit = new_habit(b"Run");
add_habit(&mut list, habit);  // habit moves into list
// Can't use habit here anymore!
```

**Where you'll use it:** Day 4 (explicitly taught), used everywhere

---

## P

### Primitive Type

Built-in basic types in Move.

**Common primitives:**

- `u8`, `u64`, `u128`, `u256` - Unsigned integers
- `bool` - Boolean (true/false)
- `address` - Blockchain address

**Example:**

```move
let count: u64 = 42;
let flag: bool = true;
let owner: address = @0x1;
```

**Where you'll use it:** Day 1 (introduction), used everywhere

---

### Public

Visible and callable from outside the module.

**Usage:**

- `public fun` - Function can be called from other modules and addresses

**Example:**

```move
public fun get_count(counter: &Counter): u64 {
    counter.value
}
```

**Where you'll use it:** Day 10 (visibility)

---

## R

### Reference

A way to access a value without taking ownership.

**Types:**

- `&T` - Immutable reference (read-only)
- `&mut T` - Mutable reference (can modify)

**Example:**

```move
fun read_value(x: &u64): u64 { *x }        // Read only
fun increment(x: &mut u64) { *x = *x + 1 } // Can modify
```

**Where you'll use it:** Day 4 onwards (everywhere!)

---

### Return Type

The type of value a function returns.

**Syntax:** `fun name(params): ReturnType { ... }`

**Example:**

```move
public fun sum(a: u64, b: u64): u64 {  // Returns u64
    a + b
}
```

**Note:** In Move, the last expression is automatically returned (no `return` keyword needed).
**Note:** In Move, when you're returning any variable you shoudlnt put `;` at the end

---

## S

### Struct

A custom data type that groups related fields together.

**Example:**

```move
public struct Habit has copy, drop {
    name: String,
    completed: bool,
}
```

**Where you'll use it:** Day 3 onwards (core concept)

---

### Sui

The blockchain platform you're building for(it's basically the Ferrari of other blockchains). Known for high performance and object-centric design.

---

## T

### Test

A function that verifies your code works correctly.

**Marked with:** `#[test]` attribute

**Example:**

```move
#[test]
fun test_sum() {
    let result = sum(1, 2);
    assert_eq!(result, 3);
}
```

**Run with:** `sui move test`

**Where you'll use it:** Day 2 onwards (testing your code)

---

### Transaction Context (TxContext)

Information about the current transaction (who sent it, when, etc.).

**Common uses:**

- `object::new(ctx)` - Create a UID
- `ctx.sender()` - Get sender's address
- `ctx.epoch()` - Get current epoch

**Example:**

```move
entry fun create_something(ctx: &mut TxContext) {
    let id = object::new(ctx);
    let owner = ctx.sender();
    // ...
}
```

**Where you'll use it:** Day 16-21 (objects and entry functions)

---

### Type Annotation

Explicitly specifying the type of a variable or expression.

**Example:**

```move
let x: u64 = 5;        // Type annotation
let name: String = b"Alice".to_string();
```

**Where you'll use it:** Day 1 onwards (Move requires types)

---

## U

### UID

Unique Identifier - what makes a struct a Sui object.

**Created with:** `object::new(ctx)`

**Example:**

```move
public struct Farm has key {
    id: UID,  // Required for objects
    value: u64,
}

fun create_farm(ctx: &mut TxContext): Farm {
    Farm {
        id: object::new(ctx),
        value: 0,
    }
}
```

**Where you'll use it:** Day 16 onwards (Sui objects)

---

## V

### Vector

A dynamic array - a list that can grow or shrink.

**Common operations:**

- `vector::empty<T>()` - Create empty vector
- `vector::push_back(&mut vec, item)` - Add to end
- `vector::length(&vec)` - Get size
- `vector::borrow(&vec, index)` - Read element
- `vector::borrow_mut(&mut vec, index)` - Modify element

**Example:**

```move
let mut numbers: vector<u64> = vector::empty();
vector::push_back(&mut numbers, 1);
vector::push_back(&mut numbers, 2);
```

**Where you'll use it:** Day 4 (vectors and lists)

---

### Visibility

Controls who can access/call functions or structs.

**Levels:**

- `fun` - Private (module only)
- `public fun` - Other modules & addresses can call
- `entry fun` - Can be called from explorers

**Where you'll use it:** Day 10 (explicitly taught)

---

## Quick Reference Tables

### Abilities Quick Reference

| Ability | Meaning                 | Common Use        |
| ------- | ----------------------- | ----------------- |
| `copy`  | Can be duplicated       | Simple data types |
| `drop`  | Can be discarded        | Most structs      |
| `store` | Can be in other structs | Nested data       |
| `key`   | Can be an object        | Top-level objects |

### Primitive Types Quick Reference

| Type      | Range              | Example                  |
| --------- | ------------------ | ------------------------ |
| `u8`      | 0 to 255           | `let x: u8 = 200;`       |
| `u64`     | 0 to 2^64-1        | `let x: u64 = 1000;`     |
| `u128`    | 0 to 2^128-1       | `let x: u128 = 1000000;` |
| `bool`    | true/false         | `let x: bool = true;`    |
| `address` | Blockchain address | `let x: address = @0x1;` |

### Reference Types Quick Reference

| Type     | Meaning             | Can Modify?        |
| -------- | ------------------- | ------------------ |
| `&T`     | Immutable reference | No (read-only)     |
| `&mut T` | Mutable reference   | Yes                |
| `T`      | By value (move)     | Transfer ownership |

---

**Using This Glossary:**

- Press `Ctrl+F` / `Cmd+F` to search for terms
- Bookmark this page for quick reference
- Terms are linked to the days where you'll learn them

**Learning Tip:** Don't try to memorize everything! Refer back to this glossary as you encounter new terms during the challenge.
