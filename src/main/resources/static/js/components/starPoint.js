const starImageSourceMap = {
  empty: "./src/images/icon_empty_star.png",
  half: "./src/images/icon_half_star.png",
  full: "./src/images/icon_star.png",
};

class StarPotint {
  constructor() {
    this.starBackgroundElement = document.querySelector(".star-background");
    this.starImages = this.starBackgroundElement.querySelectorAll("img");
    this.starPointResetButton = document.querySelector(".icon-remove-star");
    this.lockedStarPoint = false;
  }

  unlockStarPoint() {
    this.lockedStarPoint = false;
    this.starPointResetButton.style.display = "none";
    this.starBackgroundElement.style.cursor = "pointer";
  }

  lockStarPoint() {
    this.lockedStarPoint = true;
    this.starPointResetButton.style.display = "block";
    this.starBackgroundElement.style.cursor = "default";
  }

  isLockedStarPoint() {
    return this.lockedStarPoint;
  }

  bindEvents() {
    this.starBackgroundElement.addEventListener("mousemove", (e) => {
      if (this.isLockedStarPoint()) return;

      const { target, offsetX: currentUserPoint } = e;
      const { point } = target.dataset;
      const starPointIndex = parseInt(point, 10) - 1;
      const [starImageClientRect] = target.getClientRects();
      const starImageWidth = starImageClientRect.width;
      const isOverHalf = starImageWidth / 2 < currentUserPoint;

      this.renderStarPoint({ drawableLimitIndex: starPointIndex, isOverHalf });
    });

    this.starBackgroundElement.addEventListener("click", () => {
      this.lockStarPoint();
    });

    this.starPointResetButton.addEventListener("click", () => {
      this.unlockStarPoint();
      this.resetStarPoint();
    });

    this.starBackgroundElement.addEventListener("mouseout", () => {
      !this.isLockedStarPoint() && this.resetStarPoint();
    });
  }

  renderStarPoint(payload = {}) {
    const { drawableLimitIndex = -1, isOverHalf = false } = payload;

    this.starImages.forEach((starImage, index) => {
      let imageSource =
        index < drawableLimitIndex
          ? starImageSourceMap.full
          : starImageSourceMap.empty;

      if (index === drawableLimitIndex) {
        imageSource = isOverHalf
          ? starImageSourceMap.full
          : starImageSourceMap.half;
      }

      starImage.src = imageSource;
    });
  }

  resetStarPoint() {
    this.renderStarPoint();
  }

  setUp() {
    this.bindEvents();
  }
}

export default StarPotint;
