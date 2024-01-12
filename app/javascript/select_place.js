document.addEventListener('DOMContentLoaded', (event) => {
    document.querySelector('#category_select').addEventListener('change', (event) => {
        let value = event.target.value;
        if (value == '11') { // オフィス
        document.querySelector('#office').style.display = 'block';
        document.querySelector('#home').style.display = 'none';
        } else if (value == '12') { // 在宅
        document.querySelector('#office').style.display = 'none';
        document.querySelector('#home').style.display = 'block';
        }
    });
});