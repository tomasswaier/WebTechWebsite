function getItemData() {
  // todo : finish
  const randomItems =
      [
        "../resources/product_images/example_shirt_front.png",
        "../resources/product_images/example_shirt_front2.png",
        "../resources/product_images/example_shirt_front_white.png"
      ]

      const item = {};
  item.name = "White Shirt";
  item.price = 28.0;
  item.imagePath = randomItems[Math.floor(randomItems.length * Math.random())];
  ;
  return item
}

function loadMaxImages(parentId) {
  const parentElement = document.getElementById(parentId);
  console.log(screen.width);
  const itemWidth = 320;
  for (let i = 0; i < Math.max((screen.width / itemWidth), 5);
       i++) { // exatra 4 elements ff
    const itemData = getItemData()

    const elementWrapper = document.createElement("div");
    parentElement.appendChild(elementWrapper);
    elementWrapper.classList.add("flex", "flex-col")
    const imageWrapper = document.createElement("div");
    elementWrapper.appendChild(imageWrapper);
    imageWrapper.setAttribute(
        "class",
        "w-2xl max-w-80 min-w-20 h-50 bg-neutral-300 rounded-2xl mr-auto overflow-hidden");
    const itemImage = document.createElement("img");
    imageWrapper.appendChild(itemImage);
    itemImage.setAttribute("src", itemData.imagePath)

    const itemNameElement = document.createElement("span");
    elementWrapper.appendChild(itemNameElement);
    itemNameElement.innerText = itemData.name;

    const itemPriceElement = document.createElement("span");
    elementWrapper.appendChild(itemPriceElement);
    itemPriceElement.innerText = "$" + itemData.price.toFixed(2);
  }
}

loadMaxImages("newArrivals")
loadMaxImages("onSale")
