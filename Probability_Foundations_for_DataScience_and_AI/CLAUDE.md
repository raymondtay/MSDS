# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Facts

This is a Probability Theory course repository (MSDS program) containing:

- **Lecture notes**: PDF files covering probability theory (15+ files)
- **Exercises**: R scripts and Jupyter notebooks for hands-on practice
- **Topics**: Descriptive Statistics, Axioms of Probability, Conditional Probability, Discrete/Continuous Random Variables, Joint Distributions, Covariance/Correlation, Expectations/Variance, Central Limit Theorem

## Workflow Rules

- **R scripts**: Run with `Rscript <filename>.r` or in an R session
- **Jupyter notebooks**: Execute with Jupyter or convert to HTML/pDF for sharing
- **PDF lectures**: Annotated versions available for most topics

## Project Architecture

```
Probability_Foundations_for_DataScience_and_AI/
├── *.pdf                           # Lecture notes (15+ files)
├── exercises/
│   ├── *.r                         # R scripts (counting, expectations, variance, etc.)
│   ├── *.ipynb                     # Jupyter notebooks (A_M2-A_M5, conditional probability, descriptive stats)
│   ├── central_limit_theorem/      # CLT exercises (instructional skeleton)
│   ├── jointly_random_variables/   # Joint RV exercises (instructional skeleton)
│   └── single_random_variables/    # Single RV exercises (instructional skeleton)
└── 00_instructions.md              # Course overview
```

## Common Development Tasks

**Running R exercises:**
```bash
Rscript exercises/01_counting_exercises.r
Rscript exercises/understanding_expectations_variance.r
```

**Running Jupyter notebooks:**
```bash
jupyter notebook exercises/A_M2.ipynb
jupyter nbconvert --to html exercises/A_M3.ipynb  # Export to HTML
```

## Learning the Codebase

1. **Lecture notes** (`*.pdf`): Start here for theoretical concepts
2. **Jupyter notebooks** (`exercises/*.ipynb`): See worked examples
3. **R scripts** (`exercises/*.r`): Practice problems with solutions
