#' visu UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_visu_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(
      h2("Data Visualisation"),
      selectInput(inputId = ns("type_visu"),
                  label = "Select a type of visualisation",
                  choices = c("Distance / Time",
                              "Time / Activity",
                              "Distance / Month",
                              "Activity / Elevation Gain"),
                  selected = "Distance / Time"),
      plotOutput(ns("graphique"))
    )

  )
}

#' visu Server Function
#'
#' @noRd
mod_visu_server <- function(input, output, session,r){
  ns <- session$ns

  output$graphique <- renderPlot({
    validate(
      need(r$dataset,
           message = "Please upload a file"
      )
    )

    switch (input$type_visu,
            "Distance / Time" = graph_dist_time(r$dataset),
            "Time / Activity" = graph_act_time(r$dataset),
            "Activity / Elevation Gain" = graph_act_elev(r$dataset),
            "Distance / Month" = graph_dist_month(r$dataset)
    )


  })
}

## To be copied in the UI
# mod_visu_ui("visu_ui_1")

## To be copied in the server
# callModule(mod_visu_server, "visu_ui_1",r=r)

