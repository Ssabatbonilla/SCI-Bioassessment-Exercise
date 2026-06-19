# SCI Bioassessment Exercise (VSCI & VCPMI)
![R-CMD-check](https://github.com/Ssabatbonilla/SCI-Bioassessment-Exercise/actions/workflows/r-check.yml/badge.svg)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.16952880.svg)](https://doi.org/10.5281/zenodo.16952880)

A reproducible **teaching and analysis repository** for calculating Stream Condition Index (SCI) scores using benthic macroinvertebrate data.  
This repository implements three related Virginia bioassessment indices from a single workflow:

- **Virginia Stream Condition Index (VSCI)**  
- **Virginia Coastal Plain Macroinvertebrate Index (VCPMI +63)**  
- **Virginia Coastal Plain Macroinvertebrate Index (VCPMI −65)**  

The repository includes a ready-to-run R Markdown workflow, supporting metric functions, example datasets, and a graduate-level classroom assignment.

> **For textbooks, lab manuals, or chapters:**  
> Cite the DOI above and link to the repository:  
> https://github.com/Ssabatbonilla/SCI-Bioassessment-Exercise

---

## Authorship and Contributions

- **Original SCI code and metric functions** were developed by  
  **Emma Jones**, Water Team Leader, Virginia Department of Environmental Quality (VDEQ).

- **Teaching adaptation, data cleaning, documentation, and assignments** were developed by  
  **Sergio Sabat-Bonilla**, PhD candidate, Virginia Tech.

All updates preserve the original scientific logic of the indices while adapting file structure,
documentation, and outputs for instructional and reproducible research use.

---

## Contents
- `src/` — main R Markdown (`Updated_SCI Calculation 3 ways.Rmd`), `Updated_rarifyFunction.R`, and metric scripts (`VSCI_metrics_GENUS.R`, `VCPMI_metrics_GENUS.R`*).
- `data/raw/` — example inputs  
  (`masterTaxaGenus.csv`, `stationInfoBenSampsTESTSITE.csv`, `stationBenthicsTESTSITE.csv`).
- `data/processed/` — outputs written by the workflow.
- `assignments/` — classroom assignment & prompts.
- `docs/` — setup/method guide (MD + DOCX copy).
- `.github/workflows/` — minimal CI (R session check).

\* The VDEQ metric scripts may be subject to redistribution limits. If not included, place your local copies in `src/` with those exact filenames.

---

## Teaching Adaptation Notes

- File paths are **explicitly defined** using the repository structure (`src/`, `data/raw/`, `data/processed/`)
- The workflow runs **immediately after a ZIP download** without editing paths
- Outputs are written as **separate CSV files** for each index to support comparison exercises
- Rarefaction to **110 individuals** is applied following the standard EDAS workflow:
  - Samples with totals >110 are rarefied
  - Samples ≤110 remain unchanged

---

## Quick Start

### 1. Install R and RStudio

- Install **R (≥ 3.6.2)**: https://cran.r-project.org  
- Install **RStudio Desktop**: https://posit.co/download/rstudio-desktop/

### 2. Install Required R Packages

Open R or RStudio and run:

```r
install.packages(c(
  "tidyverse",
  "lubridate",
  "rmarkdown"
)
```
### 3. Download the Repository

1. Click **Code → Download ZIP**
2. Unzip the folder on your computer
3. **Do not move or rename files** inside the folder

The workflow is designed to run with **no path edits** after download.

### 4. Run the SCI Workflow

1. Open **RStudio**
2. Open the file:
    src/Updated_SCI Calculation 3 ways.Rmd
3. Click **Knit → Knit to HTML**
  The workflow will:
    - Read example data from `data/raw/`
    - Apply rarefaction where appropriate
    - Compute all three SCI variants from the same dataset
    - Write results to `data/processed/`

### 5. Output Files

After a successful run, the following files will be created:
  - `data/processed/VASCI_rarefied.csv`
  - `data/processed/VCPMI63_rarefied.csv`
  - `data/processed/VCPMI65_rarefied.csv`
---

## Classroom Assignment

A complete analysis assignment is provided in:
  assignments/SCI_Assignment.md
Students are asked to:
  - Summarize and compare SCI scores across sites
  - Evaluate impairment thresholds
  - Explore temporal trends
  - Identify biological drivers of index variation
  - Relate macroinvertebrate metrics to watershed land use
  - Communicate results using tables, figures, and ecological interpretation

This assignment is suitable for **upper-level undergraduate or graduate** courses in:
  - Stream ecology  
  - Freshwater biomonitoring  
  - Aquatic entomology  
  - Environmental assessment  
---

## Troubleshooting

- **“File not found” errors**  
  → Ensure files remain in the original folder structure after unzipping.

- **Package installation errors**  
  → Re-run `install.packages()` and restart R.

- **Unexpected NA or zero scores**  
  → Verify that input column names exactly match the example CSV templates.
---

## Contact

- **SCI methodology and index definitions:**  
  Emma Jones — emma.jones@deq.virginia.gov

- **Teaching materials and repository structure:**  
  Sergio Sabat-Bonilla — Virginia Tech