window.addEventListener('load', () => {
  const trashOutlineBtn = document.getElementById('trash-btn');
  trashOutlineBtn.addEventListener('click', () => {
    const popUp = document.getElementById('pop-up');
    popUp.setAttribute('style','display:block');
  });
});