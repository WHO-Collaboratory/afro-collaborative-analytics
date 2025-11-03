# Analytics Workshop Hackathon Website

This is a Quarto website for the Analytics Workshop Hackathon.

## Structure

- `index.qmd` - Landing page introducing the hackathon
- `data.qmd` - Data section with download links for example datasets
- `task1.qmd` through `task10.qmd` - Individual pages for each analytical task
- `_quarto.yml` - Quarto website configuration
- `styles.css` - Custom CSS for styling

## Building the Website

To build the website, run:

```r
quarto::quarto_render()
```

Or from the command line:

```bash
quarto render
```

The website will be built to the `docs/` directory.

## Preview

To preview the website locally:

```r
quarto::quarto_preview()
```

Or from the command line:

```bash
quarto preview
```

