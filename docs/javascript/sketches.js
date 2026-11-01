document$.subscribe(() => {
  const el = document.getElementById("sketch-black_box");
  if (!el || el.dataset.loaded) return;
  el.dataset.loaded = "true";

  new p5((p) => {
    p.setup = () => {
      p.createCanvas(400, 400);
    };
    p.draw = () => {
      p.background(220);
      p.ellipse(p.mouseX, p.mouseY, 50, 50);
    };
  }, el);
});
