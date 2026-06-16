document.addEventListener("DOMContentLoaded", () => {

  const timeline = document.querySelector(".timeline-scroll");

  if (!timeline) return;

  const prev = document.querySelector(".timeline-arrow.prev");
  const next = document.querySelector(".timeline-arrow.next");

  function updateArrows() {

    prev.style.opacity =
      timeline.scrollLeft <= 10 ? 0.3 : 1;

    next.style.opacity =
      timeline.scrollLeft >=
      timeline.scrollWidth - timeline.clientWidth - 10
        ? 0.3
        : 1;
  }

  prev.addEventListener("click", () => {
    timeline.scrollBy({
      left: -300,
      behavior: "smooth"
    });
  });

  next.addEventListener("click", () => {
    timeline.scrollBy({
      left: 300,
      behavior: "smooth"
    });
  });

  timeline.addEventListener("scroll", updateArrows);

  updateArrows();

});