# Building a Prod-Ready, Robust Shiny Application.
#
# README: each step of the dev files is optional, and you don't have to
# fill every dev scripts before getting started.
# 01_start.R should be filled at start.
# 02_dev.R should be used to keep track of your development during the project.
# 03_deploy.R should be used once you need to deploy your app.
#
#
###################################
#### CURRENT FILE: DEV SCRIPT #####
###################################

# Engineering

## Dependencies ----
## Add one line by package you want to add as dependency
usethis::use_package( "skimr" )
usethis::use_package( "dplyr" )
usethis::use_package( "readr" )
usethis::use_package( "DT" )
usethis::use_package("ggplot2")
usethis::use_package("lubridate")
usethis::use_pipe()

## Add modules ----
## Create a module infrastructure in R/
golem::add_module( name = "upload" ) # Nom du module onglet upload
golem::add_module( name = "data" ) # Nom du module onglet data
golem::add_module( name = "visu" ) # Nom du module onglet visu
golem::add_module( name = "about" ) # Nom du module onglet about

## Add helper functions ----
## Creates ftc_* and utils_*
golem::add_fct( "helpers" )
golem::add_utils( "helpers" )

## External resources
## Creates .js and .css files at inst/app/www
golem::add_js_file( "script" )
golem::add_js_handler( "handlers" )
golem::add_css_file( "custom" )

## Add internal datasets ----
## If you have data in your package
usethis::use_data_raw( name = "my_dataset", open = FALSE )

## Tests ----
## Add one line by test you want to create
usethis::use_test( "my_sample" )

# Documentation

## Vignette ----
usethis::use_vignette("activity")
devtools::build_vignettes()

## Code coverage ----
## (You'll need GitHub there)
usethis::use_github()
usethis::use_travis()
usethis::use_appveyor()

# You're now set! ----
# go to dev/03_deploy.R
rstudioapi::navigateToFile("dev/03_deploy.R")

