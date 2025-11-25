# Analytics Workshop Hackathon Website

This is a Quarto website for the Analytics Workshop Hackathon.

## Structure

Website files are located in the `qmd/` directory:

- `qmd/index.qmd` - Landing page introducing the hackathon
- `qmd/setup.qmd` - Setup instructions for R, RStudio, and project structure
- `qmd/data.qmd` - Data download page
- `qmd/task1.qmd` through `qmd/task10.qmd` - Individual pages for each analytical task
- `qmd/_quarto.yml` - Quarto website configuration
- `qmd/styles.css` - Custom CSS for styling
- `qmd/data/` - Data files including:
  - `linelist.rds` - Clean case linelist dataset
  - `gis/` - GIS shapefile data
  - `solutions/` - Solution files for download (excluded from rendering)
    - `sitrep.qmd` - Example situation report template
    - `task2_solution.qmd` through `task10_solution.qmd` - Solution files for tasks
- `scripts/generate_solutions.R` - Script to extract "Example Report" sections from task files and generate solution files

## Building the Website

Navigate to the `qmd/` directory and build the website:

```bash
cd qmd
quarto render
```

Or from R (in the qmd directory):

```r
quarto::quarto_render()
```

The website will be built to the `docs/` directory at the project root.

**Note:** Solution files in `qmd/data/solutions/` are excluded from rendering (configured in `_quarto.yml`) as they are intended for download only, not for display on the website.

## Preview

To preview the website locally:

```r
quarto::quarto_preview()
```

Or from the command line:

```bash
cd qmd
quarto preview
```

## Generating Solution Files

To generate solution files from task files, run the `generate_solutions.R` script:

```r
source("scripts/generate_solutions.R")
```

This script extracts the "Example Report" sections from `task3.qmd` through `task10.qmd` and creates corresponding solution files in `qmd/data/solutions/`. The solution files are configured with `echo: false` so code is hidden when rendered, making them suitable as reference solutions for participants.

## Deployment

To deploy the website to Posit Connect, use the deployment script:

```r
source("deploy.R")
```

See [`deploy.R`](deploy.R) for deployment instructions. The script uses encrypted credentials for secure deployment.

For information about the encryption setup and how to request access to use encrypted data, see [ENCRYPTION.md](ENCRYPTION.md).