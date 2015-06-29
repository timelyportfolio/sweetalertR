#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
sweetalert <- function(message, width = NULL, height = NULL) {

  # forward options using x
  x = list(
    message = message
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'sweetalert',
    x,
    width = width,
    height = height,
    package = 'sweetalertR'
  )
}

#' Widget output function for use in Shiny
#'
#' @export
sweetalertOutput <- function(outputId, width = '100%', height = '400px'){
  shinyWidgetOutput(outputId, 'sweetalert', width, height, package = 'sweetalertR')
}

#' Widget render function for use in Shiny
#'
#' @export
renderSweetalert <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  shinyRenderWidget(expr, sweetalertOutput, env, quoted = TRUE)
}
