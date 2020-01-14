

#' simple function
#'
#' @return nothing
#' @export
#'
myShinyApp <- function() {
  library(shiny)
  shinyApp(ui=shiny_dyn_ui(), server=shiny_dyn_server())
}


#' simple function 2
#'
#' it tries to load and unload `shiny` before and after the execution of the module.
#' You can disable the same by setting `options(AutoUnloadShiny = FALSE)`.
#'
#' @return dummy
#' @export
#'
myShinyApp2 <- function() {
  shiny_check()
  x <- common_finish(ui=shiny_dyn_ui(n = 1000, tag = "test2"), server=shiny_dyn_server(tag = "test2"), title = "Test App", viewer_pane = FALSE)
  shiny_unload()
  invisible(x)
}


#' simple function 3
#'
#' it tries to load and unload `shiny` before and after the execution of the module.
#' You can disable the same by setting `options(AutoUnloadShiny = FALSE)`.
#'
#' @return dummy
#' @export
#'
myShinyApp3 <- function() {
  shiny_check()
  x <- common_finish(ui=shiny_dyn_ui(n = 1000, tag = "test2"), server=shiny_dyn_server(tag = "test2"), title = "Test App", viewer_pane = FALSE, displayGadget = runApp_this)
  shiny_unload()
  invisible(x)
}
