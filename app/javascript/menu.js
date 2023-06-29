window.addEventListener('load', () => {
  const menuOpen = document.getElementById('menu-open');
  const menuItems = document.getElementById('menu-items');
  const menuClose = document.getElementById('menu-close');
  menuOpen.addEventListener('click', () => {
    menuOpen.setAttribute('style', 'display:none');
    menuItems.setAttribute('style', 'display:flex');
    menuClose.setAttribute('style', 'display:block')
  });
  menuItems.addEventListener('click', () => {
    menuClose.setAttribute('style', 'display:none')
    menuItems.setAttribute('style', 'display:none');
    menuOpen.setAttribute('style', 'display:flex');
  });
  menuClose.addEventListener('click', () => {
    menuClose.setAttribute('style', 'display:none')
    menuItems.setAttribute('style', 'display:none');
    menuOpen.setAttribute('style', 'display:flex');
  });
});