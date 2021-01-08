
#' SVG Globe Input
#'
#' @param inputId The input and CSS identifier
#' @param ... Child HTML elements
#'
#' @export
#'
globeSvgInput <- function(inputId, ...) {
  htmltools::tagList(
    r2d3::html_dependencies_d3(version = "6"),
    htmltools::htmlDependency(
      name = "d3-array",
      version = "2",
      package = "r2d3globe",
      src = "www/d3-array",
      script = "d3-array.v2.min.js"
    ),
    htmltools::htmlDependency(
      name = "d3-geo",
      version = "2",
      package = "r2d3globe",
      src = "www/d3-geo",
      script = "d3-geo.v2.min.js"
    ),
    htmltools::htmlDependency(
      name = "topojson",
      version = "3",
      package = "r2d3globe",
      src = "www/topojson",
      script = "topojson.v3.min.js"
    ),
    htmltools::htmlDependency(
      name = "land-110m",
      version = utils::packageVersion("r2d3globe"),
      package = "r2d3globe",
      src = "www/land-110m",
      script = "land-110m.js",
    ),
    htmltools::htmlDependency(
      name = "r2d3globe-svg",
      version = utils::packageVersion("r2d3globe"),
      package = "r2d3globe",
      src = "globe-svg",
      script = "globe-svg.js",
      stylesheet = "globe-svg.css"
    ),
    htmltools::tags$div(
      class = "r2d3globe-svg-container",
      id = inputId,
      `data-input-id` = inputId,
      htmltools::tags$div(
        class = "r2d3globe-svg-controls",
        htmltools::tags$button(
          class = "r2d3globe-svg-control-zoom-in",
          "Zoom In"
        ),
        htmltools::tags$button(
          class = "r2d3globe-svg-control-zoom-out",
          "Zoom Out"
        )
      ),
      ...
    )
  )
}
