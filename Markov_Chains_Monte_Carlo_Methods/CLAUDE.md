# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

# Commands

Common commands for building, testing, and formatting:
- `sbt test` – Run all unit tests across all projects.
- `sbt test <project>` – Run tests for a specific subproject (e.g., `sbt scala3-compiler-bootstrapped/test`).
- `sbt dist/Universal/packageBin` – Build a distribution for the JVM.
- `scalafmt` – Format the whole codebase.
- `scalafmt --check` – Verify that the codebase follows the project's formatting rules.

# Architecture Overview

This repository implements the Scala 3 compiler and its ecosystem. The layout is roughly:

- `compiler/` – The core Scala 3 compiler implementation, containing both bootstrapped and non‑bootstrapped variants.
- `library/` – The Scala 3 standard library and its modules.
- `language-server/` – Language Server Protocol (LSP) implementation that powers IDE integrations.
- `repl/` – The Read‑Eval‑Print Loop for interactive Scala 3 execution.
- `packaging/` – Build scripts and configuration for creating binary distributions for different platforms (JVM, JS, native).

Understanding the architecture usually requires looking at a single component directory and its accompanying tests. Start with the `compiler/` directory to see the pipeline from parsing to code generation, then examine the `library/` tests to see expected behavior.

# Development workflow

1. Edit the relevant source file(s).
2. Run the focused test set for that component: `sbt test <component>`.
3. Run the full test suite: `sbt test`.
4. Check formatting: `scalafmt --check` and fix any issues.
5. Build a distribution if needed: `sbt dist/Universal/packageBin`.

All changes must pass `scalafmt --check` before they are considered ready for review.

# Notes for future Claude instances

- Use `sbt` for all builds and tests; do not invoke the compiler directly.
- Prefer small, incremental test runs (`sbt test <project>`) before running the full suite.
- The repository uses Java 17; ensure any added code targets that runtime.
- When modifying the compiler, remember that the bootstrapped variant needs a previously built compiler; follow the existing bootstrap scripts.