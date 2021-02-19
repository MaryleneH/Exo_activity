#' about UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_about_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(

             h2("How to use your own data"),
             h3("Go to https://connect.garmin.com/, and log in"),
             tags$img(src = "www/garminhome.png", width = "50%", align = "center"),
             h3("Go to Activities > All Activities, and click on Export CSV"),
             tags$img(src = "www/garmindashboard.png", width = "50%", align = "center")

    )

  )
}

#' about Server Function
#'
#' @noRd
mod_about_server <- function(input, output, session){
  ns <- session$ns

}

## To be copied in the UI
# mod_about_ui("about_ui_1")

## To be copied in the server
# callModule(mod_about_server, "about_ui_1")

