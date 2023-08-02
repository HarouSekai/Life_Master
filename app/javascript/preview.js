window.addEventListener('DOMContentLoaded',()=>{
  const imageForm = document.getElementById('image');
  const imageExpForm = document.getElementById('edit-image-exp');
  if (!imageExpForm) return null;

  imageForm.addEventListener('change',(e)=>{
    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);
    const hardCodeImage = document.getElementById('image-preview');
    const alreadyPreviewImage = hardCodeImage.querySelector('img');
    if (alreadyPreviewImage) {
      alreadyPreviewImage.setAttribute('src',blob);
      return null;
    } else {
      const previewImage = `<img src="${blob}">`;
      hardCodeImage.insertAdjacentHTML('afterbegin',previewImage);
    }
  });

  imageExpForm.addEventListener('keyup',(e)=>{
    const previewText = document.getElementById('image-exp-preview');
    previewText.innerText = e.target.value;
  });
});