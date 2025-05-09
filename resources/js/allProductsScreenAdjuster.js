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
  main.classList.remove("grid-flow-col", "gap-8");
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
  document.getElementById(childFieldsetId)
      .parentElement.classList.remove("mt-20");

  parentElement.appendChild(turnOnFilterButton);

  turnOnFilterButton.addEventListener(
      "click", function() { showHideFieldset(childFieldsetId) });
}
if (screen.width <= 850) {
    adjustScreenFilters("itemFiltersWrapper", "itemsFiltersFieldset");
}
