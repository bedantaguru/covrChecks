

#' simple function
#'
#' @return nothing
#' @export
#'
myShinyApp <- function() {
  shiny::shinyApp(ui=shiny_dyn_ui(), server=shiny_dyn_server())
}
