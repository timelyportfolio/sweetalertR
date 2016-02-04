library(sweetalertR)
library(htmltools)


# do the first sweetalert example using a tagList
#  and sweetalert with a selector
#  This is the advisable way for most R users
browsable(tagList(
  HTML('
<div class="showcase sweet">
	<h4>Sweet Alert</h4>
	<button>Show error message</button>

	<h5>R Code:</h5>
	<pre>
  sweetalert(
    selector = ".showcase.sweet button"
    ,title = "Oops..."
    ,text =  "Something went wrong!"
    ,type = "error"
  )
  </pre>
</div>
  ')
  ,sweetalert(
    selector = '.showcase.sweet button'
    ,title = "Oops..."
    ,text =  "Something went wrong!"
    ,type = "error"
  )
))

# do the first sweetalert example using a tagList
#   but with sweetalert( selector = NULL )
#   assuming someone knows HTML and JavaScript
browsable(tagList(
  HTML('
<div class="showcase sweet">
	<h4>Sweet Alert</h4>
	<button onclick = "sweetAlert( \'Oops...\',\'Something went wrong!\',\'error\')">
    Show error message
  </button>

	<h5>R Code:</h5>
	<pre>
  # no selector so sweetalert htmlwidget just used for dependencies
  sweetalert()
  </pre>
</div>
  ')
  ,sweetalert()
))
