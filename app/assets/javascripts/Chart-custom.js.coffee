@.changeColor = (bar_graph) ->
  for i in [0..bar_graph.datasets[0].bars.length - 1]
    bar = bar_graph.datasets[0].bars[i]
    if bar.value < 60
      bar.fillColor = "rgba(191, 63, 63, 0.7)"
      bar.strokeColor = "rgba(189, 55, 55, 0.7)"

  bar_graph.update()
