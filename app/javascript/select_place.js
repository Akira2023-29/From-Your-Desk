document.addEventListener('turbo:load', (event) => {
    document.querySelector('#category_select').addEventListener('change', (event) => {
        let value = event.target.value;
        if (value == '1') { // オフィス
            document.querySelector('#office').style.display = 'block';
            document.querySelector('#office select').disabled = false;
            document.querySelector('#home').style.display = 'none';
            document.querySelector('#home select').disabled = true;
        } else if (value == '2') { // 在宅
            document.querySelector('#office').style.display = 'none';
            document.querySelector('#office select').disabled = true;
            document.querySelector('#home').style.display = 'block';
            document.querySelector('#home select').disabled = false;
        }
    });
});

// category_selectの選択が変更されたときに、
// 選択されていないフォームのselect要素を無効にし（disabled = true）
// 選択されたフォームのselect要素を有効にする（disabled = false）