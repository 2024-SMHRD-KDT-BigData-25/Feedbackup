document.addEventListener("DOMContentLoaded", () => {
  const cards = document.querySelectorAll(".card");
  const observerOptions = {
    threshold: 0.3,
  };

  const observer = new IntersectionObserver((entries) => {
    entries.forEach((entry, index) => {
      if (entry.isIntersecting) {
        setTimeout(() => {
          entry.target.classList.add("active");
        }, index * 200); // 카드마다 200ms 간격 애니메이션
      } else {
        entry.target.classList.remove("active");
      }
    });
  }, observerOptions);

  cards.forEach((card) => observer.observe(card));
});
