function changeImage(src) {
  let mainImage = document.getElementById('mainImage')
  mainImage.src = src;
}

const hamburgerBtn = document.querySelector("#hamburger_btn");
const hamburgerMenu = document.querySelector("#hamburger_default");

hamburgerBtn.addEventListener(
    "click", () => { hamburgerMenu.classList.toggle("hidden"); })
