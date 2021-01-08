
library(tidyverse)

curl::curl_download(
  "https://d3js.org/d3-array.v2.min.js",
  "inst/www/d3-array/d3-array.v2.min.js"
)
curl::curl_download(
  "https://d3js.org/d3-geo.v2.min.js",
  "inst/www/d3-geo/d3-geo.v2.min.js"
)
curl::curl_download(
  "https://unpkg.com/topojson@3",
  "inst/www/topojson/topojson.v3.min.js"
)
curl::curl_download(
  "https://cdn.jsdelivr.net/npm/world-atlas@2/land-110m.json",
  "inst/www/land-110m/land-110m.json"
)

read_file("inst/www/land-110m/land-110m.json") %>%
  str_trim() %>%
  paste0("var land110m = ", . , ";\n") %>%
  write_file("inst/www/land-110m/land-110m.js")
