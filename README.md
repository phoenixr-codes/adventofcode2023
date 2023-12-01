# Advent of Code 2023

This year in [Dart](https://dart.dev/) - using it the first time!


## Project Structure

```text
.
├── day-DD/                   each day has its own directory
│   ├── input.txt             my individual input (for both parts)
│   └── part-N/               part one or two of the day's challenge
│       ├── main.dart         the program computing the result
│       └── test-input.txt    example input (same for everyone)
└── README.md
```


## Running a Program

Navigate to the program's directory and run it with `dart run main.dart`.


You can switch between the test input and the real input by changing the path in `main.dart`.

```diff
- File('../input.txt')
+ File('test-input.txt')
```
