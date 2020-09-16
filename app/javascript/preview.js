document.addEventListener('DOMContentLoaded', function(){
  if ( !document.getElementById('image-list')){ return false; }
  const imageList = document.getElementById('image-list');

  const createImageHTML = (blob) => {
    const imageElement = document.createElement('div');
    const blobImage = document.createElement('img');

    blobImage.setAttribute('src', blob);
    blobImage.setAttribute('class','preview-image')

    imageElement.appendChild(blobImage);
    imageList.appendChild(imageElement);
  };

  document.getElementById('menu_image').addEventListener('change', function(e){
    const imageContent = document.querySelector('img');
    if (imageContent){
      imageContent.remove();
    }

    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);

    createImageHTML(blob);
    const hiddenImage = document.getElementById('form-image');
    const hiddenText = document.getElementById('form-image-text');
    hiddenImage.setAttribute("type","hidden");
    hiddenText.setAttribute("class","hidden");
  });
});