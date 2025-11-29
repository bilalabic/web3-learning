# 21-Day Sui Move Learning Challenge

A simple, beginner-friendly guide to learning Sui Move programming in 21 days.

## How It Works

**Each day has its own folder** with everything you need:

- `day_01/` - Day 1: Modules + Primitive Types
- `day_02/` - Day 2: Functions
- `day_03/` - Day 3: Structs
- ...
- `day_21/` - Day 21: Final Tests

Each day folder contains:
- `README.md` - Explanation of concepts + reading materials
- `Move.toml` - Move package configuration
- `sources/main.move` - Your code file with TODO comments

## Getting Started

### Prerequisites

- Sui CLI installed ([Installation Guide](https://docs.sui.io/build/install))
- Git installed
- Basic terminal knowledge

### First Steps

```bash
# Clone or download the project
cd 21Challenge

# Navigate to day 1
cd day_01

# Read the README
cat README.md

# Build and test
sui move build
sui move test
```

## How to Use

1. **Start with Day 1**: Go to `day_01/` folder
2. **Read the README**: Each day's README explains:
   - What you'll learn
   - Key concepts (with examples)
   - Your tasks
   - Reading materials (Move Book links)
3. **Code**: Open `sources/main.move` and complete the TODOs
4. **Test**: Run `sui move test` in that day's folder
5. **Commit**: Commit your work
6. **Move to next day**: Repeat for `day_02/`, `day_03/`, etc.

## Project Structure

```
21Challenge/
├── README.md              # This file
├── day_01/
│   ├── README.md          # Day 1 guide
│   ├── Move.toml          # Package config
│   └── sources/
│       └── main.move      # Your code
├── day_02/
│   ├── README.md
│   ├── Move.toml
│   └── sources/
│       └── main.move
├── ...
└── day_21/
    ├── README.md
    ├── Move.toml
    └── sources/
        └── main.move
```

## Learning Goals

After completing this challenge, you'll understand:

- ✅ Move syntax and basic concepts
- ✅ Structs, enums, vectors
- ✅ Ownership in Move
- ✅ Sui object model
- ✅ Entry functions
- ✅ Events
- ✅ Testing

## Daily Workflow

For each day:

1. **Read** (15-30 min) - Read the README and Move Book links
2. **Code** (30-60 min) - Complete the TODOs in `main.move`
3. **Test** (5 min) - Run `sui move test`
4. **Commit** (1 min) - Commit your work

## Useful Links

- [Move Book](https://move-book.com) - Main learning resource
- [Sui Documentation](https://docs.sui.io) - Sui platform docs

## Important Notes

- **Work in the day's folder**: Each day is self-contained
- **Read before coding**: Understanding concepts is crucial
- **Keep it simple**: This is educational material, not production code
- **Test often**: Run tests after each change
- **Commit daily**: Track your progress
- **Clean commits**: The `.gitignore` file is set up to exclude build artifacts - commit only your source code

🎉 Success!

After 21 days, you'll have:
- 21 working Move modules
- Understanding of Sui Move fundamentals
- Ability to build your own Move programs

**Happy learning!**
