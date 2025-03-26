function displayInputImage() {
  // displays  selected user image to user for confirmation/better ux
  const inputElemnt = document.getElementById("user_image")
  inputElemnt.classList.add("hidden", "none")
  var image = inputElemnt.files[0];
  var reader = new FileReader();
  reader.onload = function(e) {
    const imageElement = document.getElementById("display_image")
    imageElement.src = e.target.result;
    imageElement.classList.add("min-h-40", "min-w-60", "max-h-60");
  };
  reader.readAsDataURL(image);
}

class InputField {
  constructor() { this.elemntCount = 0; }
  displayInputField(parentElementId) {
    const parentElement = document.getElementById(parentElementId);
    const wrapper = document.createElement("div");
    parentElement.appendChild(wrapper);
    wrapper.classList.add("w-60", "h-40", "rounded-2xl", "border-2",
                          "overflow-hidden", "flex")
    wrapper.innerHTML = ` <label for = "user_image">
    <input id="user_image" class="text-transparent absolute" name="user_image" type="file" onChange="displayInputImage()" /> 
    <img src = "../resources/icons/addImage.png" alt = "" class = "relative w-20 left-20 top-10" >
    </label>
    `
  }
}

function initiateImageInputField(parentElement) {
  const inputField = new InputField();
  inputField.displayInputField(parentElement);

}
