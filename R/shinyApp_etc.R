
utils::globalVariables(
  c("abort", "actionButton", "dialogViewer", "fluidPage", "numericInput",
    "observeEvent", "paneViewer", "plotOutput", "renderPlot",
    "runApp", "runGadget", "shinyApp", "stopApp")
)

runGadget_this <- function(app, viewer = paneViewer()){
  if (isTRUE(getOption("shiny.testmode"))) {
    identity(app)
  }else{
    runGadget(app = app, viewer = viewer, stopOnCancel = FALSE)
  }
}



runApp_this <- function(app, viewer = paneViewer()){
  if (isTRUE(getOption("shiny.testmode"))) {
    identity(app)
  }else{
    if(is.null(viewer)){
      viewer <- utils::browseURL
    }
    runApp(appDir = app, launch.browser = viewer, quiet = TRUE)
  }
}

common_finish <- function(ui, server, title, viewer_pane = TRUE, displayGadget = runGadget_this) {

  if (viewer_pane) {
    displayGadget(shinyApp(ui, server))
  } else {
    viewer <- dialogViewer(title,
                           width = 900,
                           height = 700
    )
    displayGadget(shinyApp(ui, server),
                  viewer = viewer)
  }
}

# shiny load unload

shiny_check <- function(force_load = FALSE) {
  if (!force_load) {
    if (!interactive()) {
      if(!(isTRUE(getOption("shiny.testmode")))){
        abort("Need an interactive session for this functionality.")
      }
    }
  }

  if (!requireNamespace("shiny", quietly = TRUE)) {
    abort("'shiny' package is required for this functionality.")
  }

  es <- loadNamespace("shiny")
  try(attachNamespace(es), silent = TRUE)

}

shiny_unload <- function() {
  if(!(isTRUE(getOption("shiny.testmode")))){
    AutoUnloadShiny <- getOption("AutoUnloadShiny")
    if (is.null(AutoUnloadShiny)) AutoUnloadShiny <- TRUE
    if (AutoUnloadShiny) {
      # following cooldown is required for "later: interrupt occurred while executing callback."
      Sys.sleep(0.5)
      suppressWarnings(try(unloadNamespace("miniUI"), silent = TRUE))
    }
  }
}


# dynamically generated ui and server

shiny_dyn_ui <- function(n=100, tag = "n"){
  fluidPage(
    numericInput(tag, paste0("Value of ", tag), n),
    actionButton("done", "Done"),
    plotOutput("plot")
  )
}

shiny_dyn_server <- function(tag = "n"){
  function(input, output, session) {
    output$plot <- renderPlot( {
      n0 <- input[[tag]]
      if(!is.null(n0)){
        set.seed(1)
        graphics::plot(stats::rnorm(n0))
      }
    } )

    observeEvent(input$done, {
      stopApp("dummy output")
    })

  }
}
