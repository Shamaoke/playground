
# Sample 0008: C++23 Ranges Pipeline & String View Exploration #

A modern C++ demonstration showcasing functional-style string processing using
C++20/C++23 Ranges, lazy evaluation, and compile-time string formatting.

## Purpose ##

The project serves as a playground to understand **pipe operators**, **lazy evaluation**,
and modern text transformations without traditional, imperative `for` loops.

## Key Concepts Explored ##

* **`std::views::split` & `std::views::join_with`**

  Splitting strings by delimiter and joining them back with custom separators on
  the fly.

* **Lazy Evaluation**

  Chaining multiple `std::views::transform` operations where computation only
  occurs when data is materialized.

* **Type Materialization**

  Using `std::ranges::to<std::string>()` to collect a complex lazy pipeline into
  a physical container.

* **`std::print` (C++23)**

  Type-safe, high-performance console output replacing heavy `std::ostream` streams.

## How It Works ##

1. Fetches a raw text string from a mock Messager utility;

2. Breaks the string into separate words using a space delimiter;

3. Converts every letter of each word to uppercase via nested transform adapters;

4. Glues the processed words back togethr with a custom `" ~> "` string view separator;

5. Materializes the final sequence into a `std::string` and prints it safely.

