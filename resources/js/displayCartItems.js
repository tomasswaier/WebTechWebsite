// async function getCartContents() {
//   try {
//     // todo change
//     const response =
//         await fetch('http://localhost:8000/api/getUserCartItems/1');
//     if (!response.ok) {
//       throw new Error('Network response was not ok');
//     }
//     const [item] = await response.json();
//
//     return {
//       name : item.name,
//       price : item.price,
//       imagePath : `product_images/${item.imagePath}`
//     };
//   } catch (error) {
//     console.error('Error fetching item:', error);
//     return {name : "Error", price : 0, imagePath : `Error`};
//   }
// }
function dummyGetCartContents(numberOfItems) {
  return Array(numberOfItems)
      .fill()
      .map((_, index) => new Promise((resolve) => {
             // Simulate async delay (e.g., network/database latency)
             setTimeout(() => {
               resolve({
                 name : `Car Shirt ${index + 1}`,
                 price : 29.99 + index,
                 size : "L",
                 imagePath : "product_images/example_shirt_front_white.png"
               });
             }, 1); // Short delay for testing
           }));
}
async function loadCartContents(parentId, numberOfItems) {
  const parentElement = document.getElementById(parentId);

  // Create an array of promises for all items
  // const itemPromises = Array().fill().map(() => getItemData());
  const itemPromises = dummyGetCartContents(numberOfItems);
  const allItems = await Promise.all(itemPromises);
  console.log(allItems);

  allItems.forEach(itemData => {
    const elementWrapper = document.createElement("li");
    parentElement.appendChild(elementWrapper);
    elementWrapper.setAttribute(
        "class",
        "grid grid-flow-row sm:grid-flow-col w-full space-y-3 place-items-center sm:place-items-start justify-center sm:justify-normal border-b sm:border-none");

    const image = document.createElement("img");
    elementWrapper.appendChild(image);
    image.src = itemData.imagePath;
    image.setAttribute("class", "w-auto max-h-32 sm:max-h-16");

    const itemNameElement = document.createElement("span");
    elementWrapper.appendChild(itemNameElement);
    itemNameElement.innerText = itemData.name;
    const itemPriceElement = document.createElement("span");
    elementWrapper.appendChild(itemPriceElement);
    itemPriceElement.innerText = "$" + parseFloat(itemData.price).toFixed(2);
    const itemSizeElement = document.createElement("span");
    elementWrapper.appendChild(itemSizeElement);
    itemSizeElement.innerText = "Size: " + itemData.size;
    const itemCount = document.createElement("input");
    elementWrapper.appendChild(itemCount);
    itemCount.setAttribute("class",
                           "w-15 border border-black rounded-lg text-center");
    itemCount.type = "number";
    itemCount.placeholder = "1";
    const itemDelete = document.createElement("button");
    elementWrapper.appendChild(itemDelete);
    itemDelete.type = "button";
    itemDelete.setAttribute(
        "class",
        "hover:bg-gray-200 transition duration-300 size-fit p-2 rounded-lg hover:cursor-pointer");

    itemDelete.innerText = "del";
  });
}
window.loadCartContents = loadCartContents;
