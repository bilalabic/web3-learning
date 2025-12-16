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

**New to programming?** Start with `day_00_setup/README.md` for detailed setup instructions!

- Sui CLI installed ([Quick Install Guide](https://docs.sui.io/build/install) or see `day_00_setup/`)
- Code editor (VS Code recommended)
- Git installed
- Basic terminal knowledge

**Not sure if you're ready?** Check the setup guide in `day_00_setup/README.md` for step-by-step instructions.

### Quick Start (If You Have Sui CLI Installed)

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

**First time?** See detailed explanation of these commands below ⬇️

## How to Use

1. **Setup First** (if needed): Check `day_00_setup/README.md` for installation help
2. **Start with Day 1**: Go to `day_01/` folder
3. **Read the README**: Each day's README explains:
   - What you'll learn
   - Key concepts (with examples)
   - Your tasks
   - Reading materials (Move Book links)
   - **Related Days** - see which days connect to this one
4. **Code**: Open `sources/main.move` and complete the TODOs
   - Look for `TODO:` comments with instructions
   - Code examples and hints are provided as comments
5. **Test**: Run `sui move test` in that day's folder
6. **Stuck?** Check the solution:
   - Look at `sources/solution.move` for the complete answer
   - Try solving it yourself first!
   - Solutions include helpful comments explaining the logic
7. **Commit**: Commit your work
8. **Move to next day**: Repeat for `day_02/`, `day_03/`, etc.

## Project Structure

```
21Challenge/
├── README.md              # This file
├── GLOSSARY.md            # Terms and definitions reference
├── TROUBLESHOOTING.md     # Solutions to common problems
├── day_00_setup/          # Setup instructions (start here if new!)
│   └── README.md
├── day_01/
│   ├── README.md          # Day 1 guide
│   ├── Move.toml          # Package config
│   └── sources/
│       ├── main.move      # Your code (complete the TODOs)
│       └── solution.move  # Solution (check if stuck)
├── day_02/
│   ├── README.md
│   ├── Move.toml
│   └── sources/
│       ├── main.move
│       └── solution.move
├── ...
└── day_21/
    ├── README.md
    ├── Move.toml
    └── sources/
        ├── main.move
        └── solution.move
```

### Key Files

- **GLOSSARY.md** - Quick reference for Move terms (module, struct, ownership, etc.)
- **TROUBLESHOOTING.md** - Solutions to common errors
- **day_00_setup/** - Detailed setup guide (Sui CLI, VS Code, terminal basics)
- **sources/main.move** - Your code file with TODOs
- **sources/solution.move** - Complete solution (try first, then check!)

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

## Understanding Commands

### `sui move build`

**What it does:** Compiles your Move code into bytecode

**Where to run:** In each day's folder (e.g., inside `day_01/`)

**When to run:** After writing or changing code

**Success looks like:**
```
BUILDING day_01
Build successful
```

**Error?** See TROUBLESHOOTING.md or check the error message (it shows the line number!)

### `sui move test`

**What it does:** Runs all test functions to verify your code works

**Where to run:** In each day's folder

**When to run:** After completing tasks

**Success looks like:**
```
Running Move unit tests
Test result: OK. Total tests: 3; passed: 3; failed: 0
```

**Failure?** Fix the code until all tests pass. The error message shows which test failed.

### Common Terminal Commands

```bash
# Show current directory
pwd

# List files
ls

# Change directory (move to a folder)
cd folder_name

# Go back one folder
cd ..

# Go to home directory
cd ~

# Read a file
cat filename.md
```

**Need more help?** Check `day_00_setup/README.md` for terminal basics!

## Three Projects, Progressive Learning

This challenge includes **3 different projects** to help you practice:

### Days 1-7: Habit Tracker
**Focus:** Move basics
- Learn: structs, vectors, ownership, control flow
- Build: A simple habit tracking system

### Days 8-14: Task Bounty Board
**Focus:** Intermediate concepts
- Learn: enums, Option, visibility, aggregations
- Build: A task management system with rewards

### Days 15-21: Farm Simulator
**Focus:** Sui-specific features
- Learn: Objects, UID, entry functions, events
- Build: A farm with on-chain state

Each project reinforces previous concepts while introducing new ones!

## Learning Features

This challenge includes several features to help you learn effectively:

### 📚 Comprehensive Documentation
- **GLOSSARY.md** - Quick reference for all Move terms (alphabetically organized)
- **TROUBLESHOOTING.md** - Solutions to common errors with examples
- **day_00_setup/** - Step-by-step installation guide using suiup

### 🗺️ Smart Navigation
- **Related Days** sections in each day's README show:
  - Prerequisites (which days to complete first)
  - What comes next (where this leads)
  - Connected concepts across days

### 💡 Learning Aids in Every Day
- **TODO comments** with clear instructions
- **Code examples** showing syntax and patterns
- **Hints** for tricky parts
- **Complete solutions** with explanatory comments
- **Move Book links** for deeper understanding

### 🧪 Test-Driven Learning
- Each day includes tests to verify your code
- Tests fail until you complete the tasks correctly
- Immediate feedback on your progress

### 🎯 When You Get Stuck
1. **Re-read the day's README** - the answer is often there
2. **Check GLOSSARY.md** - understand the terms
3. **Look at code examples** - see how it's done
4. **Check TROUBLESHOOTING.md** - common errors and fixes
5. **Peek at solution.move** - but try first!

## Useful Links

- [Move Book](https://move-book.com) - Main learning resource
- [Sui Documentation](https://docs.sui.io) - Sui platform docs

## Community & Support

Need help or want to connect with other learners?

- **WhatsApp Community:** [Join our support group](https://chat.whatsapp.com/DZH6y2XMDQ58NY5DheUhQs?mode=hqrc)
- **X (Twitter):** [@ercandotsui](https://x.com/ercandotsui)

Don't hesitate to ask questions - learning together is better!

## Important Notes

- **Work in the day's folder**: Each day is self-contained
- **Read before coding**: Understanding concepts is crucial
- **Use the learning aids**: TODO comments, hints, and examples are there to help
- **Try before checking solutions**: Learning happens through struggle!
- **Follow Related Days links**: They help you understand the learning path
- **Keep it simple**: This is educational material, not production code
- **Test often**: Run tests after each change
- **Use reference docs**: GLOSSARY and TROUBLESHOOTING are your friends
- **Commit daily**: Track your progress
- **Clean commits**: The `.gitignore` file is set up to exclude build artifacts - commit only your source code

🎉 Success!

After 21 days, you'll have:
- 21 working Move modules
- Understanding of Sui Move fundamentals
- Ability to build your own Move programs

**Happy learning!**
