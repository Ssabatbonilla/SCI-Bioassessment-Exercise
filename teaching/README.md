# Instructor Materials

This folder contains **instructor-only scaffolding** for running the SCI workflow
robustly and for generating starter outputs / answer keys aligned with the assignment.

Students should **not** use files in this folder unless explicitly instructed.

---

## Files

### `Teacher_SCI_Run_and_AnswerKey.Rmd`

- Runs **VSCI**, **VCPMI (+63)**, and **VCPMI (–65)**
- Writes outputs to `data/processed/`
- Includes starter analyses aligned to assignment questions:
  - **Q1–Q2**: site summaries and threshold exceedance
  - **Q3**: time-series logic (repeated vs single-visit sites)
  - **Q8**: abundance vs SCI score

---

## Why this file exists

This instructor workflow produces **the same SCI scores as the student workflow**  
when run on the same input data.

It exists because instructors need:
- cleaner error handling
- predictable outputs
- reproducible grading figures

To support this, the workflow adds two robustness steps:

1. **Excluded Taxa recoding**  
   Student CSVs often store `Excluded Taxa` as `0 / 1`,  
   but EDAS logic expects `0 / -1`.

2. **Metadata preservation across rarefaction**  
   `rarify()` drops non-ID columns; this workflow saves and re-joins
   exclusion flags and taxonomic-level indicators needed downstream.

These steps **do not change results** — they prevent avoidable failures.

---

## Teaching note

Students should use the **public workflow in the repository root**.

This folder exists to support:
- grading
- troubleshooting
- reproducible answer keys
