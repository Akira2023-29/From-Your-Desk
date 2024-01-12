document.addEventListener('turbo:load', (event) => {
    document.querySelector('#category_select').addEventListener('change', (event) => {
        let value = event.target.value;
        if (value == '1') { // オフィス
        document.querySelector('#office').style.display = 'block';
        document.querySelector('#home').style.display = 'none';
        } else if (value == '2') { // 在宅
        document.querySelector('#office').style.display = 'none';
        document.querySelector('#home').style.display = 'block';
        }
    });
});