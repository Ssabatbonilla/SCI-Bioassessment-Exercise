# Step-by-Step Guide: Running the SCI Calculation Script

This guide walks you through calculating Stream Condition Index (SCI) scores using three index options run from the same workflow:

VSCI (Virginia Stream Condition Index; impairment threshold 60)

VCPMI + 63 (Virginia Coastal Plain Macroinvertebrate Index; impairment threshold 42)

VCPMI − 65 (Virginia Coastal Plain Macroinvertebrate Index; impairment threshold 42)

These are not three unrelated methods — they are three index options computed from the same input dataset and the same wrapper function.

---

1) What you will do in this exercise

You will:

Download this repository as a ZIP and unzip it.

Install required R packages.

Run the R Markdown workflow to compute SCI scores.

Save and inspect the output CSVs written by the workflow.

Use outputs to answer interpretation and watershed-context questions.

2) Install R and RStudio
- Make sure you have R (≥ 3.6.2) installed.
- Install RStudio for easier script execution.

---

3) Install Required R Packages
Open R or RStudio and run:
```r
install.packages(c("tidyverse", "lubridate", "lazyeval", "rmarkdown"))
```

---

4) Download the repository (ZIP) and unzip
  1. On GitHub, click Code → Download ZIP
  2. Unzip the folder somewhere you can easily find (e.g., Documents)
    > Important: Do not rename the folders src/ or data/, and do not move files out of them.
---

5) Confirm the required repository structure
After unzipping, you should see this structure:
  Scripts (src/)
    - src/Updated_SCI Calculation 3 ways.Rmd (main workflow)
    - src/VSCI_metrics_GENUS.R (VSCI metrics)
    - src/VCPMI_metrics_GENUS.R (VCPMI metrics)
    - src/Updated_rarifyFunction.R (rarefaction function)
  Example input data (data/raw/)
    - data/raw/masterTaxaGenus.csv
    - data/raw/stationInfoBenSampsTESTSITE.csv
    - data/raw/stationBenthicsTESTSITE.csv
  Outputs (data/processed/)
    - This folder will be created automatically when you run the workflow.
---

6) Run the workflow (recommended method)
  1. Open RStudio
  2. Open the file:
    - src/Updated_SCI Calculation 3 ways.Rmd
  3. Click Knit → Knit to HTML
    If everything is correct, the document will render and write output files.
---

7) Where outputs are saved
The workflow writes outputs to:
  - data/processed/VASCI_rarefied.csv
  - data/processed/VCPMI63_rarefied.csv
  - data/processed/VCPMI65_rarefied.csv
    These files contain the calculated SCI scores and supporting metric columns.
---

8) Troubleshooting (most common issues)
  “File not found”
    Cause: the repository structure was changed (files moved/renamed) or the Rmd was run outside the repo folder.
      Fix:
        - Re-download the ZIP
        - Unzip again
        - Do not rename folders/files
        - Knit the Rmd from inside the unzipped repository folder
  “Package not found”
    Cause: required packages not installed.
      Fix:
        - install.packages(c("tidyverse", "lubridate", "lazyeval", "rmarkdown"))
  “My data doesn’t work with this template”
    Your data must match the required input column names (e.g., BenSampID, FinalID, Individuals, and any exclusion field used in the template). If using your own data, align your columns to the example templates in data/raw/.

---
9) Watershed land-use context (WikiWatershed)
  To compare land cover among sites, use:
    https://wikiwatershed.org/model/
  For each site watershed (or consistent watershed delineation), record land cover (%) and compare patterns among sites. Relate land cover differences to SCI patterns.
---

Contact
  - For SCI methodology questions: Emma Jones (emma.jones@deq.virginia.gov)
  - For questions about this teaching repository (structure, files, assignment): Sergio Sabat-Bonilla (ssabatbonilla@vt.edu)