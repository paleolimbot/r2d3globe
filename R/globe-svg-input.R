
globeSvgInput <- function(inputId, ...) {
  htmltools::tagList(
    htmltools::htmlDependency(
      name = "d3",
      version = 6,
      src = "https://d3js.org",
      script = "d3.v6.min.js"
    ),
    htmltools::htmlDependency(
      name = "d3-array",
      version = 2,
      src = "https://d3js.org",
      script = "d3-array.v2.min.js"
    ),
    htmltools::htmlDependency(
      name = "d3-geo",
      version = 2,
      src = "https://d3js.org",
      script = "d3-geo.v2.min.js"
    ),
    htmltools::htmlDependency(
      name = "topojson",
      version = 3,
      src = "https://unpkg.com",
      script = "topojson@3"
    ),
    htmltools::htmlDependency(
      name = "r2d3globe-svg",
      version = utils::packageVersion("r2d3globe"),
      package = "r2d3globe",
      src = "globe-svg",
      script = "globe-svg.js",
      stylesheet = "globe-svg.css"
    ),
    shiny::tags$div(
      class = "r2d3-globe-svg-container",
      id = inputId,
      `data-input-id` = inputId,
      shiny::p("Hello world! Literally!!"),
      ...
    )
  )
}

