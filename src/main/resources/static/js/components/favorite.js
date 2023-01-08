class Favorite {
  constructor() {
    this.favoriteElement = document.querySelector(".content-favorite");
  }

  bindEvents() {
    this.favoriteElement.addEventListener("click", (e) => {
      const cPath = e.composedPath();
      const element = cPath.find((e) => e.tagName === "BUTTON");

      if (!element) return;

      element.classList.toggle("on");
    });
  }

  setUp() {
    this.bindEvents();
  }
}

export default Favorite;
