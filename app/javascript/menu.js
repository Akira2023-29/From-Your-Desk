document.addEventListener('turbo:load', (event) => {
    const menuButton = document.getElementById('menu-button');
    const menu = document.querySelector('[role="menu"]');

    if (menuButton) {
        // 初期状態ではメニューを非表示にする
        menu.style.display = 'none';

        // メニューボタンがクリックされたときのイベントリスナーを設定
        menuButton.addEventListener('click', () => {
            // メニューが表示されている場合は非表示にし、非表示の場合は表示する
            if (menu.style.display === 'none') {
                menu.style.display = 'block';
            } else {
                menu.style.display = 'none';
            }
        });
    }
});