window.addEventListener('load', () =>{
  const editOutlineBtn = document.getElementById('edit-outline-btn');
  const articleHardCode = document.getElementById('article-hard-code');
  const editArticleForm = document.getElementById('edit-article-form');
  const editSubmitBtn = document.getElementById('edit-submit-btn');
  editOutlineBtn.addEventListener('click', () => {
    articleHardCode.setAttribute('style', 'display:none');
    editArticleForm.setAttribute('style', 'display:block');
  });
  editSubmitBtn.addEventListener('click', () => {
    editArticleForm.setAttribute('style', 'display:none');
    articleHardCode.setAttribute('style', 'display:block');
  });
});