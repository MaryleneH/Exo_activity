#' data UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_data_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(
      column(6,
             h2("Preview Data"),
             fluidRow(column(6,
                    numericInput(inputId = ns("nb_sample"),
                                 label = "Number of rows to sample",
                                 value = 10,
                                 min = 1,
                                 step =1)),
             column(6,
                    actionButton(inputId = ns("bouton"),
                                 label = "sample"))),
             ),
      column(6,
             h2("Preview Specific Activities"),
             selectInput(inputId = ns("type_activity"),
                         label = "Type of Activity to show",
                         choices = NULL))

      ),
    fluidRow(

      column(6, DT::DTOutput(ns("data_sample"),width = "100%")),
      column(5,
        DT::DTOutput(ns("data_type"))

      )
    )

  )
}

#' data Server Function
#'
#' @noRd
mod_data_server <- function(input, output, session,r){
  ns <- session$ns

  # local <- reactiveValues(
  #   table <- my_sample(dataset = r$dataset, number = 10)
  # )
  local <- reactiveValues()


  # Affiche de la table echantillonnée
  observeEvent(input$bouton,{

    req(r$dataset)


    local$table <- my_sample(dataset = r$dataset, number = input$nb_sample)

    output$data_sample <- DT::renderDT({
      validate(
        need(r$dataset,
             message = "Please upload a file"
        )
      )

      local$table %>%
        DT::datatable(options = list(scrollX = TRUE))

})

  })

  output$data_sample <- DT::renderDT({
    validate(
      need(r$dataset,
           message = "Please upload a file"
      )
    )
    local$table <- my_sample(dataset = r$dataset, number = 10)
    local$table %>%
      DT::datatable(options = list(scrollX = TRUE))


  })

  output$data_type <- DT::renderDT({
    validate(
      need(input$file,
           message = "Please upload a file"
      )
    )

  })

  # Affichage de la table par type d'activité

  observeEvent(r$dataset,{
    req(r$dataset)

    updateSelectInput(
      session = session,
      inputId = "type_activity",
      choices = unique(r$dataset$`Activity Type`)
    )
  })

  output$data_type <- DT::renderDT({
    validate(
      need(r$dataset,
           message = "Please upload a file"
      )
    )

    filtrer_activites(r$dataset,input$type_activity) %>%
      DT::datatable(options = list(scrollX = TRUE))

  })


}

## To be copied in the UI
# mod_data_ui("data_ui_1")

## To be copied in the server
# callModule(mod_data_server, "data_ui_1",r = r)

