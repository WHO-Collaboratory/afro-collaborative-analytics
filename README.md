# Analytics Workshop Hackathon Website

This is a Quarto website for the Analytics Workshop Hackathon.

## Structure

Website files are located in the `qmd/` directory:

- `qmd/index.qmd` - Landing page introducing the hackathon
- `qmd/data.qmd` - Data section with download links for example datasets
- `qmd/task1.qmd` through `qmd/task10.qmd` - Individual pages for each analytical task
- `qmd/_quarto.yml` - Quarto website configuration
- `qmd/styles.css` - Custom CSS for styling

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

## Preview

To preview the website locally:

```r
quarto::quarto_preview()
```

## Deployment

To deploy the website to Posit Connect, use the deployment script:

```r
source("deploy.R")
```

See [`deploy.R`](deploy.R) for deployment instructions. The script uses encrypted credentials for secure deployment.

For information about the encryption setup and how to request access to use encrypted data, see [ENCRYPTION.md](ENCRYPTION.md).