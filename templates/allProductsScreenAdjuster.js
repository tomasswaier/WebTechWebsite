function showHideFieldset(childFieldsetId) {
  const fieldset = document.getElementById(childFieldsetId);
  if (!fieldset) {
    return;
  }
  if (fieldset.classList.contains("hidden")) {
    fieldset.classList.remove("hidden");
  } else {
    fieldset.classList.add("hidden");
  }
}

function adjustScreenFilters(parentId, childFieldsetId) {
  const main = document.getElementById("main");
  main.classList.remove("flex-row");
  main.classList.add("flex-col");
  const parentElement = document.getElementById(parentId);
  if (!parentElement) {
    return;
  }
  parentElement.classList.remove("my-20")
  parentElement.classList.add("mt-20")

  const turnOnFilterButton = document.createElement("button");
  turnOnFilterButton.innerText = "Show Filters";
  turnOnFilterButton.classList.add("border-2", "rounded-xl", "p-1");
  document.getElementById(childFieldsetId).classList.add("hidden");

  parentElement.appendChild(turnOnFilterButton);

  turnOnFilterButton.addEventListener(
      "click", function() { showHideFieldset(childFieldsetId) });
}
if (screen.width <= 768) {
  adjustScreenFilters("itemFiltersWrapper", "itemsFiltersFieldset");
}
