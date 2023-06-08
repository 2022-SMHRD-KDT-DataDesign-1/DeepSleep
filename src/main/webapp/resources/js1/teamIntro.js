// Inspiration -  Frontend Mentor
// https://www.frontendmentor.io/challenges/myteam-multipage-website-mxlEauvW
const cardControllers = document.querySelectorAll("[data-card-controller]");
const cardFront = document.querySelector("[data-card='front']");
const cardBack = document.querySelector("[data-card='back']");

cardControllers.forEach(controller => {
  controller.addEventListener("click", (e) => {
    const card = e.currentTarget.parentElement.parentElement;
    const isVisible = card.dataset.visible;

    if (isVisible === "false") {
      card.setAttribute("data-visible", true);
    } else {
      card.setAttribute("data-visible", false);
    }
  })
})