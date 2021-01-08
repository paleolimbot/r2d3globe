
d3v6.select(window).on("load", function() {
    d3v6.selectAll(".r2d3globe-svg-container")
      .each(function(d, i) {
        var container = d3v6.select(this);
        var svg = container
            .append("svg")
            .attr("class", "r2d3globe-svg");
  
          var divWidth = container.node()
            .getBoundingClientRect().width;
          var divHeight = container.node()
            .getBoundingClientRect().height;
          
          var dim = Math.min(divWidth, divHeight);
          var height = dim;
          var width = dim;
          
          var zoom_factor = 1.2;
          var drag_factor_x = 0.5;
          var drag_factor_y = drag_factor_x;
          // TODO: animate zoom! https://observablehq.com/@d3/projection-transitions
  
          var projection = d3v6.geoOrthographic()
            .translate([width / 2, height / 2])
            .scale(dim / 2)
            .rotate([98,-39])
            .clipAngle(90);
  
          var path = d3v6.geoPath()
            .projection(projection);
  
          var graticule = d3v6.geoGraticule();
  
          var line = svg.append("path")
            .datum(graticule)
            .attr("class", "r2d3globe-svg-graticule")
            .attr("d", path);
  
          svg.call(
            d3v6.drag()
              .on("drag", function(d) {
  
                  var λ = d3v6.scaleLinear()
                      .domain([0, projection.scale() * 2 / drag_factor_x])
                      .range([0, 360]);
  
                  var φ = d3v6.scaleLinear()
                      .domain([0, projection.scale() * 2 / drag_factor_y])
                      .range([0, 180]);
  
                  var rotation = projection.rotate();
  
                  projection.rotate([rotation[0] + λ(d.dx), rotation[1] + φ(-d.dy)]);
                  svg.selectAll("path").attr("d", path);
              })
          );
  
          container.select(".r2d3globe-svg-control-zoom-in")
            .on("click", function() {
              projection.scale(projection.scale() * zoom_factor);
              svg.selectAll("path").attr("d", path);
            });
  
          container.select(".r2d3globe-svg-control-zoom-out")
            .on("click", function() {
              projection.scale(projection.scale() / zoom_factor);
              svg.selectAll("path").attr("d", path);
            });
          
          svg.append("path")
            .datum(topojson.feature(land110m, land110m.objects.land))
            .attr("class", "r2d3globe-land")
            .attr("d", path);
          
          // async load is probably better but not sure how this could work with
          // htmltools dependencies
          //d3v6.json("https://cdn.jsdelivr.net/npm/world-atlas@2/land-110m.json")
          //  .then(function(world) {
          //      svg.append("path")
          //        .datum(topojson.feature(world, world.objects.land))
          //        .attr("class", "r2d3globe-land")
          //        .attr("d", path);
          //  });
      });
  });
