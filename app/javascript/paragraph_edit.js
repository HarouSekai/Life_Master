window.addEventListener('load', () =>{
  const editParagraphBtn = document.getElementById('edit-paragraph-btn');
  const paragraphHardCode = document.getElementById('paragraph-hard-code');
  const editParagraphForm = document.getElementById('edit-paragraph-form');
  const editSubmitBtn = document.getElementById('edit-submit-btn');
  editParagraphBtn.addEventListener('click', () => {
    paragraphHardCode.setAttribute('style', 'display:none');
    editParagraphForm.setAttribute('style', 'display:block');
  });
  editSubmitBtn.addEventListener('click', () => {
    editParagraphForm.setAttribute('style', 'display:none');
    paragraphHardCode.setAttribute('style', 'display:block');
  });
});