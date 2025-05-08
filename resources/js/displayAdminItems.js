// const {document} = require("postcss");

async function getItemData(category = 'all', count = 0, numberOfItems = 8,
                           currentSort = 'oldest', currentMaxPrice = Infinity,
                           search = '') {
  try {
    console.log(search);
    const response = await fetch(`http://localhost:8000/api/items?&count=${
        count}&load=${numberOfItems}`);

    if (!response.ok)
      throw new Error('Network response was not ok');

    const data = await response.json();
    console.log(data);
    return data.items;
  } catch (error) {
    console.error('Error fetching items:', error);
    return [];
  }
}

async function loadMaxImages(parentId, numberOfItems = 10, category = 'all',
                             currentSort = 'oldest', currentMaxPrice = Infinity,
                             count = 0, search = '') {
  const parentElement = document.getElementById(parentId);

  try {
    const allItems = await getItemData(category, count, numberOfItems,
                                       currentSort, currentMaxPrice, search);
    const itemsToShow = allItems.slice(0, numberOfItems);

    itemsToShow.forEach(itemData => {
      const elementWrapper = document.createElement("tr");
      parentElement.appendChild(elementWrapper);

      const imageWrapper = document.createElement("td");
      elementWrapper.appendChild(imageWrapper);
      const imageBorder = document.createElement("div");
      imageWrapper.appendChild(imageBorder);
      imageBorder.setAttribute(
          "class", " w-40 h-20 bg-neutral-300 rounded-lg overflow-hidden")
      const itemImage = document.createElement("img");
      itemImage.src = itemData.imagePath;
      itemImage.alt = itemData.category;
      imageBorder.appendChild(itemImage);

      const categoryWrapper = document.createElement("td");
      elementWrapper.appendChild(categoryWrapper);
      const itemCategoryElement = document.createElement("span");
      itemCategoryElement.textContent = itemData.category;
      categoryWrapper.appendChild(itemCategoryElement);

      const nameWrapper = document.createElement("td");
      elementWrapper.appendChild(nameWrapper);
      const itemNameElement = document.createElement("span");
      itemNameElement.textContent = itemData.name;
      nameWrapper.appendChild(itemNameElement);

      const priceWrapper = document.createElement("td");
      elementWrapper.appendChild(priceWrapper);
      const itemPriceElement = document.createElement("span");
      itemPriceElement.textContent =
          `$${parseFloat(itemData.price).toFixed(2)}`;
      priceWrapper.appendChild(itemPriceElement);

      const stockWrapper = document.createElement("td");
      elementWrapper.appendChild(stockWrapper);
      const itemStockCountElement = document.createElement("span");
      itemStockCountElement.textContent =
          itemData.stock > 0 ? "in Stock" : "Out of Stock";
      stockWrapper.appendChild(itemStockCountElement);

      const editWrapper = document.createElement("td");
      elementWrapper.appendChild(editWrapper);
      const linkToEditPageElement = document.createElement("a");
      editWrapper.append(linkToEditPageElement);
      linkToEditPageElement.href = `adminProductDetail/${itemData.id}`;
      const editImageElement = document.createElement("img");
      linkToEditPageElement.appendChild(editImageElement);
      editImageElement.src = "icons/editIcon.png";
      editImageElement.classList.add("w-12");

      const deleteWrapper = document.createElement("td");
      elementWrapper.appendChild(deleteWrapper);
      const deleteImageElement = document.createElement("img");
      deleteWrapper.append(deleteImageElement);
      deleteImageElement.src = "icons/trashIcon.png";
      deleteImageElement.classList.add("w-12");
    });
  } catch (error) {
    console.error('Error loading images:', error);
    parentElement.innerHTML =
        '<p class="text-red-500">Error loading products</p>';
  }
}
window.loadMaxImages = loadMaxImages;
