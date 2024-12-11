document.addEventListener("DOMContentLoaded", () => {
  const buttons = document.querySelectorAll(".tab-btn");
  const boxes = document.querySelectorAll(".result-box");

  buttons.forEach((button) => {
    button.addEventListener("click", () => {
      buttons.forEach((btn) => btn.classList.remove("active"));
      button.classList.add("active");
      const target = button.getAttribute("data-target");

      boxes.forEach((box) => {
        if (box.getAttribute("data-category") === target) {
          box.style.display = "block"; 
        } else {
          box.style.display = "none";
        }
      });
    });
  });
});
