#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @importFrom skimr skim
#' @importFrom readr read_csv
#' @importFrom DT DTOutput renderDT datatable
#' @importFrom dplyr sample_n filter
#' @importFrom ggplot2 ggplot aes geom_point geom_boxplot geom_col labs theme_minimal
#' @importFrom lubridate month
#' @noRd
app_server <- function( input, output, session ) {
  # List the first level callModules here

  r <- reactiveValues()

  callModule(mod_upload_server, "upload_ui_1", r = r)
  callModule(mod_data_server, "data_ui_1",r = r)
  callModule(mod_visu_server, "visu_ui_1",r=r)

}
