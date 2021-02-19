#' upload UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_upload_ui <- function(id){
  ns <- NS(id)
  tagList(

    fluidRow(
      column(6,
        h2("Upload your data"),
        h3("Send your Garming data here"),
        fileInput(inputId = ns("file"),
                  label = "Upload a CSV file",
                  placeholder = "No file selected",
                  accept = c(
                    'text/csv',
                    'text/comma-separated-values',
                    '.csv'
                  ))

      ),
      column(6,
        h2("Data Preview"),
        h3("Summary of your uploaded data"),
        verbatimTextOutput(ns("sortie_skim"))

      )
    )

  )
}

#' upload Server Function
#'
#' @noRd
mod_upload_server <- function(input, output, session, r){
  ns <- session$ns

  output$sortie_skim <- renderPrint({
    validate(
      need(input$file,
           message = "Please upload a file"
      )
    )

    r$dataset <-  readr::read_csv(file = input$file$datapath,na = "--")

    r$dataset$Distance <- as.numeric(r$dataset$Distance)
    r$dataset$`Elev Gain` <- as.numeric(r$dataset$`Elev Gain`)

    skimr::skim(r$dataset)

  })


}

## To be copied in the UI
# mod_upload_ui("upload_ui_1")

## To be copied in the server
# callModule(mod_upload_server, "upload_ui_1", r = r)

