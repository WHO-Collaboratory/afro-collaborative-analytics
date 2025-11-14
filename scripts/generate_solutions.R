# Script to extract "Example Report" sections from task files
# and create solution files in data/solutions/

# Load required packages
if (!requireNamespace("pacman", quietly = TRUE)) {
  install.packages("pacman")
}
pacman::p_load(here, readr, stringr)

# Set working directory to project root
project_root <- here::here()
qmd_dir <- file.path(project_root, "qmd")
solutions_dir <- file.path(project_root, "qmd", "data", "solutions")

# Ensure solutions directory exists
if (!dir.exists(solutions_dir)) {
  dir.create(solutions_dir, recursive = TRUE)
}

# Function to extract Example Report section from a task file
extract_example_report <- function(task_file) {
  # Read the file
  lines <- readLines(task_file, warn = FALSE)

  # Find the line with "## Example Report"
  example_report_idx <- which(str_detect(lines, "^## Example Report"))

  if (length(example_report_idx) == 0) {
    warning(paste("No '## Example Report' section found in", task_file))
    return(NULL)
  }

  # Find the line with "## Additional Resources" (if it exists)
  additional_resources_idx <- which(str_detect(lines, "^## Additional Resources"))

  # Determine end index
  if (length(additional_resources_idx) > 0 && additional_resources_idx > example_report_idx) {
    end_idx <- additional_resources_idx - 1
  } else {
    end_idx <- length(lines)
  }

  # Extract the section (from "## Example Report" to end or "## Additional Resources")
  # Skip the "## Example Report" heading line and any empty line after it
  start_idx <- example_report_idx + 1
  # Skip empty line after heading if present
  if (start_idx <= length(lines) && lines[start_idx] == "") {
    start_idx <- start_idx + 1
  }

  extracted_lines <- lines[start_idx:end_idx]

  # Remove download button links to solution files
  # Pattern matches: <a href="data/solutions/taskX_solution.qmd" download
  extracted_lines <- extracted_lines[
    !str_detect(extracted_lines, '<a href="data/solutions/task\\d+_solution\\.qmd" download')
  ]

  # Remove trailing empty lines
  while (length(extracted_lines) > 0 && extracted_lines[length(extracted_lines)] == "") {
    extracted_lines <- extracted_lines[-length(extracted_lines)]
  }

  return(extracted_lines)
}

# Function to create solution file with YAML header
create_solution_file <- function(task_num, content) {
  # Create YAML header
  yaml_header <- c(
    "---",
    paste0('title: "Task ', task_num, ' Solution"'),
    "format:",
    "  html",
    "execute:",
    "  echo: false",
    "  warning: false",
    "  message: false",
    "---",
    ""
  )

  # Combine YAML header with content
  full_content <- c(yaml_header, content)

  # Create output filename
  output_file <- file.path(solutions_dir, paste0("task", task_num, "_solution.qmd"))

  # Write to file
  writeLines(full_content, output_file)

  cat("Created:", output_file, "\n")
}

# Process tasks 2 through 9
for (task_num in 1:9) {
  task_file <- file.path(qmd_dir, paste0("task", task_num, ".qmd"))

  if (!file.exists(task_file)) {
    warning(paste("Task file not found:", task_file))
    next
  }

  # Extract Example Report section
  extracted_content <- extract_example_report(task_file)

  if (!is.null(extracted_content)) {
    # Create solution file
    create_solution_file(task_num, extracted_content)
  }
}

cat("\nDone! Solution files created in", solutions_dir, "\n")
