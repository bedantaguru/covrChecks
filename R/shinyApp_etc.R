

shiny_dyn_ui <- function(n=100, tag = "n"){
  fluidPage(
    numericInput(tag, paste0("Value of ", tag), n),
    plotOutput("plot")
  )
}

shiny_dyn_server <- function(tag = "n"){
  function(input, output) {
    output$plot <- renderPlot( {
      n0 <- input[[tag]]
      if(!is.null(n0)){
        set.seed(1)
        plot(rnorm(n0))
      }
    } )
  }
}
