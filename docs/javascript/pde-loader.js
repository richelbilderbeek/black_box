document$.subscribe(() => {
  document.querySelectorAll("canvas.pde").forEach((canvas) => {
    if (canvas.dataset.loaded) return;
    canvas.dataset.loaded = "true";
    Processing.loadSketchFromSources(canvas, [canvas.dataset.src]);
  });
});
