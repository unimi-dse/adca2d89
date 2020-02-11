#' Shiny Interface
#'
#' This is an interface for receiving and providing information, using Shiny package.
#'
#' @return shiny app
#'
#' @export
GUI <- function(){

  shiny::runApp(system.file("shiny/GUI", package = "sentimeter"))

}
