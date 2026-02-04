# Instructor Materials

This folder contains **instructor-only scaffolding** for running the SCI workflow robustly
and for generating starter outputs / answer keys aligned with the assignment.

Students should **not** use files in this folder unless explicitly instructed.

---

## Files

### `Teacher_SCI_Run_and_AnswerKey.Rmd`

- Runs **VSCI**, **VCPMI (+63)**, and **VCPMI (–65)**
- Writes outputs to `data/processed/`
- Includes starter analyses aligned to assignment questions:
  - Q1–Q2: site summaries and threshold exceedance
  - Q3: time-series logic (repeated vs single-visit sites)
  - Q8: abundance vs SCI score

---

## Why this file exists

This instructor workflow adds two robustness steps that avoid common student errors:

1. **Excluded Taxa recoding**  
   Student CSVs often store `Excluded Taxa` as `0 / 1`,  
   but EDAS logic expects `0 / -1`.

2. **Metadata preservation across rarefaction**  
   `rarify()` drops non-ID columns; this workflow saves and re-joins
   exclusion flags and taxonomic-level indicators needed downstream.

---

## How this differs from the student version (important clarification)

All **data, calculations, and final SCI scores are identical** between the
student-facing workflow and this instructor workflow.

Both versions:
- Use the **same input data**
- Apply the **same rarefaction target**
- Run the **same VSCI, VCPMI (+63), and VCPMI (–65) algorithms**
- Produce the **same SCI scores for each sample**

**Nothing about the science or scoring changes.**

### What *does* change (and why)

This instructor file exists to control two *technical failure points* that commonly
occur in teaching environments and across machines:

#### 1. Excluded Taxa recoding (technical safeguard)

- Many student CSVs encode `Excluded Taxa` as `0 / 1`
- EDAS-based SCI logic expects `0 / -1`
- If this mismatch is not corrected, taxa exclusion logic can silently fail

👉 This file **re-codes values internally**, without changing the data meaning,
to ensure the exclusion rules behave exactly as intended.

#### 2. Metadata preservation across rarefaction (structural safeguard)

- The provided `rarify()` function intentionally drops all non-ID columns
- Several downstream SCI steps require:
  - exclusion flags
  - taxonomic-level indicators (genus / family / order, etc.)

👉 This instructor workflow **temporarily saves and re-joins** those columns
after rarefaction so calculations remain stable.

### Why students do *not* need this version

The student workflow is intentionally simpler:
- fewer moving parts
- less cognitive load
- fewer opportunities to modify internals accidentally

As long as students:
- use the provided templates
- follow instructions exactly

they will obtain **the same numerical results** as this instructor workflow.

### What actually differs pedagogically

The main difference is **how results are organized and visualized**, not what
the results are:

- Instructors need:
  - clean batch runs
  - reproducible answer keys
  - stable plots for grading and demonstration
- Students need:
  - a clear path from data → score → interpretation

This file exists to support **grading, troubleshooting, and reproducibility** —
not to change outcomes.

---

## Teaching note

Students should use the **public workflow in the repository root**.
This folder exists to support:
- grading
- troubleshooting
- reproducible answer keys
