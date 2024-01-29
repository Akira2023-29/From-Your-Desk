document.addEventListener('turbo:load', setupCategorySelect);
document.addEventListener('turbo:render', setupCategorySelect);

// setupCategorySelect関数を作成
function setupCategorySelect() {
    const categorySelect = document.querySelector('#category_select');
    if (categorySelect) {
    categorySelect.addEventListener('change', (event) => {
        let value = event.target.value;
        const office = document.querySelector('#office');
        const home = document.querySelector('#home');
      if (value == '1') { // オフィス
        office.style.display = 'block';
        office.querySelector('select').disabled = false;
        home.style.display = 'none';
        home.querySelector('select').disabled = true;
      } else if (value == '2') { // 在宅
        office.style.display = 'none';
        office.querySelector('select').disabled = true;
        home.style.display = 'block';
        home.querySelector('select').disabled = false;
        }
        });
    }
}
