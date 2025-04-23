async function getItemData(category = 'all', count = 0, numberOfItems = 8,
                           currentSort = 'oldest', currentMaxPrice = Infinity,
                           search = '') {
  try {
    console.log(search);
    const response = await fetch(`http://localhost:8000/api/items?category=${
        category}&count=${count}&load=${numberOfItems}&price=${
        currentMaxPrice}&sort=${currentSort}&search=${search}`);

    if (!response.ok)
      throw new Error('Network response was not ok');

    const data = await response.json();
    return data.items;
  } catch (error) {
    console.error('Error fetching items:', error);
    return [];
  }
}

async function loadMaxImages(parentId, numberOfItems, category = 'all',
                             currentSort = 'oldest', currentMaxPrice = Infinity,
                             count = 0, search = '') {
  const parentElement = document.getElementById(parentId);

  try {
    const allItems = await getItemData(category, count, numberOfItems,
                                       currentSort, currentMaxPrice, search);
    const itemsToShow = allItems.slice(0, numberOfItems);

    itemsToShow.forEach(itemData => {
      const elementWrapper = document.createElement("div");
      elementWrapper.classList.add("flex", "flex-col");
      parentElement.appendChild(elementWrapper);

      const imageWrapper = document.createElement("a");
      imageWrapper.href = `product/detail/${itemData.id}`;
      imageWrapper.className =
          "w-2xl w-80 h-52 max-h-50 bg-neutral-300 rounded-2xl overflow-hidden";
      elementWrapper.appendChild(imageWrapper);

      const itemImage = document.createElement("img");
      itemImage.src = itemData.imagePath;
      itemImage.alt = itemData.name;
      imageWrapper.appendChild(itemImage);

      const itemNameElement = document.createElement("span");
      itemNameElement.textContent = itemData.name;
      elementWrapper.appendChild(itemNameElement);

      const itemPriceElement = document.createElement("span");
      itemPriceElement.textContent =
          `$${parseFloat(itemData.price).toFixed(2)}`;
      elementWrapper.appendChild(itemPriceElement);
    });
  } catch (error) {
    console.error('Error loading images:', error);
    parentElement.innerHTML =
        '<p class="text-red-500">Error loading products</p>';
  }
}
window.loadMaxImages = loadMaxImages;
