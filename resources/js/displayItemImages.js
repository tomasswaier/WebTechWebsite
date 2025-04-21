async function getItemImages(productId) {
  try {
    const response =
        await fetch(`http://localhost:8000/api/products/${productId}/images`);
    if (!response.ok)
      throw new Error('Network response was not ok');

    const data = await response.json();

    // Use images exactly as returned from API (already have full URLs)
    console.log(data);
    return {
      product_id : data.product_id,
      product_name : data.product_name,
      images : data.images.map(
          img => ({imagePath : img.image_url, is_main : img.is_main == true}))
    };
  } catch (error) {
    console.error('Error fetching item images:', error);
    // Fallback with proper full URL
    return {
      product_id : productId,
      product_name : "Product",
      images : [ {
        imagePath :
            "http://localhost:8000/product_images/example_shirt_Cool.png", // Full
        // URL
        is_main : true,
        alt_text : "Default product image"
      } ]
    };
  }
}
async function loadItemImages(parentId, productId) {
  const parentElement = document.getElementById(parentId);

  try {
    // Get all images for this product
    const productData = await getItemImages(productId);

    // Clear previous content
    parentElement.innerHTML = '';

    // Create and append main image
    const mainImage = productData.images.find(img => img.is_main);
    if (mainImage) {
      const mainImgElement = document.createElement("img");
      mainImgElement.src = mainImage.imagePath;

      mainImgElement.alt = mainImage.alt_text || productData.product_name;
      mainImgElement.className =
          "object-cover h-auto w-fit max-h-[50vh] mb-4 justify-self-center";
      parentElement.appendChild(mainImgElement);
    }

    // Create thumbnail container
    const thumbnailsContainer = document.createElement("div");
    thumbnailsContainer.className =
        "grid grid-cols-3 gap-4 py-4 overflow-x-auto overflow-y-hidden items-center";
    parentElement.appendChild(thumbnailsContainer);

    // Add all
    // thumbnailshttp://localhost:8000/api/products/3c554169-6309-41d5-90cc-4b54d1f54503/images
    productData.images.forEach(image => {
      const thumbnail = document.createElement("img");
      thumbnail.src = image.imagePath;
      thumbnail.alt = image.alt_text || productData.product_name;
      thumbnail.className = "cursor-pointer hover:opacity-80 transition";
      thumbnailsContainer.appendChild(thumbnail);

      // thumbnail.addEventListener(
      //     'click', () => { mainImgElement.src = image.imagePath; });
    });

  } catch (error) {
    console.error('Error loading images:', error);
    parentElement.innerHTML =
        '<p class="text-red-500">Error loading product images</p>';
  }
}

window.loadItemImages = loadItemImages;
