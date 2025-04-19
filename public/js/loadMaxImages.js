async function getItemData() {
  try {
    // todo change
    const response = await fetch('http://localhost:8000/api/items/1');
    if (!response.ok) {
      throw new Error('Network response was not ok');
    }
    const [item] = await response.json();

    return {
      name : item.name,
      price : item.price,
      imagePath : `product_images/${item.imagePath}`
    };
  } catch (error) {
    console.error('Error fetching item:', error);
    // Fallback to static data if API fails
    const randomItems = [
      //"example_shirt_front.png",
      //"example_shirt_front2.png",
      "example_shirt_front_white.png", //"example_shirt_Cool.png",
                                       //"example_shirt_Montag.png"
    ];

    return {
      name : "White Shirt",
      price : 28.0,
      imagePath : `product_images/${
          randomItems[Math.floor(Math.random() * randomItems.length)]}`
    };
  }
}

async function loadMaxImages(parentId, numberOfItems) {
  const parentElement = document.getElementById(parentId);

  // Create an array of promises for all items
  const itemPromises = Array(numberOfItems).fill().map(() => getItemData());

  const allItems = await Promise.all(itemPromises);

  allItems.forEach(itemData => {
    const elementWrapper = document.createElement("div");
    parentElement.appendChild(elementWrapper);
    elementWrapper.classList.add("flex", "flex-col");

    const imageWrapper = document.createElement("a");
    elementWrapper.appendChild(imageWrapper);
    imageWrapper.href = "productDetail";
    imageWrapper.setAttribute(
        "class",
        "w-2xl max-w-80 min-w-20 h-50 bg-neutral-300 rounded-2xl mr-auto overflow-hidden");

    const itemImage = document.createElement("img");
    imageWrapper.appendChild(itemImage);
    itemImage.setAttribute("src", itemData.imagePath);
    itemImage.setAttribute("alt", itemData.name);

    const itemNameElement = document.createElement("span");
    elementWrapper.appendChild(itemNameElement);
    itemNameElement.innerText = itemData.name;

    const itemPriceElement = document.createElement("span");
    elementWrapper.appendChild(itemPriceElement);
    itemPriceElement.innerText = "$" + itemData.price.toFixed(2);
  });
}
