options(repos = c(CRAN = "https://cloud.r-project.org"))


# if pak isnt installed, install it
if (!requireNamespace("pak", quietly = TRUE)) {
  message("pak not installed, installing...")
  install.packages("pak")
}

dev_packages <- c(
  "devtools",
  "roxygen2",
  "testthat",
  "usethis",
  "covr",
  "checkmate"
)

# get the list of development packages that are not installed
missing_dev_packages <- dev_packages[!dev_packages %in% installed.packages()[,'Package']]
print(missing_dev_packages)




if (length(missing_dev_packages) == 0) {
  sprintf("The following packages are installed: %s\n\n", paste(dev_packages, collapse = ", ")) |>
    message()
  # exit if all development packages are installed
  quit(save = "no", status = 0)
} 
msg <- "The following packages are installed: %s\n\n"
msg <- sprintf(msg, paste(setdiff(dev_packages, missing_dev_packages), collapse = ", "))
msg <- paste(msg, "The following packages are not installed: %s\n\n")
msg <- sprintf(msg, paste(missing_dev_packages, collapse = ", "))
message(msg)

pak::pkg_install(missing_dev_packages)
