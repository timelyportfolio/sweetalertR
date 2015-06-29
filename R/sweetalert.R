#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
sweetalert <- function(
  selector = NULL
  ,event = 'onclick'
  ,title = ''
  ,text = ''
  ,type = NULL
  ,allowOutsideClick = FALSE
  ,showConfirmButton = TRUE
  ,showCancelButton = FALSE
  ,closeOnConfirm = TRUE
  ,closeOnCancel = TRUE
  ,confirmButtonText = 'OK'
  ,confirmButtonColor = '#AEDEF4'
  ,cancelButtonText = 'Cancel'
  ,imageUrl = NULL
  ,imageSize = NULL
  ,timer = NULL
  ,customClass = ''
  ,html = FALSE
  ,animation = TRUE
  ,allowEscapeKey = TRUE
  ,inputType = 'text'
  ,inputPlaceholder = ''
  ,inputValue = ''
  ,evalFunction = NULL
  ,width = 0
  ,height = 0
) {


  # convert evalFunction to htmlwidget::JS if text
  if( !is.null(evalFunction) && !inherits(evalFunction,"JS_EVAL") ) evalFunction = htmlwidgets::JS(evalFunction)

  # forward options using x
  x = list(
    selector = selector
    ,event = event
    ,options = list(
      title = title
      ,text = text
      ,type = type
      ,allowOutsideClick = allowOutsideClick
      ,showConfirmButton = showConfirmButton
      ,showCancelButton = showCancelButton
      ,closeOnConfirm = closeOnConfirm
      ,closeOnCancel = closeOnCancel
      ,confirmButtonText = confirmButtonText
      ,confirmButtonColor = confirmButtonColor
      ,cancelButtonText = cancelButtonText
      ,imageUrl = imageUrl
      ,imageSize = imageSize
      ,timer = timer
      ,customClass = customClass
      ,html = html
      ,animation = animation
      ,allowEscapeKey = allowEscapeKey
      ,inputType = inputType
      ,inputPlaceholder = inputPlaceholder
      ,inputValue = inputValue
    )
    ,evalFunction = evalFunction
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
