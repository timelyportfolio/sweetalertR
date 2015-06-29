#' sweetalert in R as an htmlwidget
#'
#' Create sweetalerts in R with this function.  For details on the arguments, see the
#' \href{http://t4t5.github.io/sweetalert/}{SweetAlert demo}.
#'
#' @examples
#' \dontrun{
#' library(sweetalertR)
#' library(htmltools)
#'
#'
#' # do the first sweetalert example using a tagList
#' #  and sweetalert with a selector
#' #  This is the advisable way for most R users
#' browsable(tagList(
#'   HTML('
#'    <div class="showcase sweet">
#'      <h4>Sweet Alert</h4>
#'      <button>Show error message</button>
#'
#'      <h5>R Code:</h5>
#'      <pre>
#'        sweetalert(
#'         selector = ".showcase.sweet button"
#'         ,title = "Oops..."
#'         ,text =  "Something went wrong!"
#'         ,type = "error"
#'        )
#'      </pre>
#'    </div>
#'   ')
#'   ,sweetalert(
#'     selector = '.showcase.sweet button'
#'     ,title = "Oops..."
#'     ,text =  "Something went wrong!"
#'     ,type = "error"
#'   )
#' ))
#'
#' # do the first sweetalert example using a tagList
#' #   but with sweetalert( selector = NULL )
#' #   assuming someone knows HTML and JavaScript
#' browsable(tagList(
#' HTML('
#' <div class="showcase sweet">
#' 	<h4>Sweet Alert</h4>
#' 	<button onclick = "sweetAlert( \'Oops...\',\'Something went wrong!\',\'error\')">
#'     Show error message
#'   </button>
#'
#' 	<h5>R Code:</h5>
#' 	<pre>
#'   # no selector so sweetalert htmlwidget just used for dependencies
#'   sweetalert()
#'   </pre>
#' </div>
#'   ')
#'   ,sweetalert()
#' ))
#' }
#'
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
