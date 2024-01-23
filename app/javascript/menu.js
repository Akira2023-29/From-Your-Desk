document.addEventListener('turbo:load', (event) => {
    const menuButton = document.getElementById('menu-button');
    const diagnosisMenuButton = document.getElementById('diagnosis_menu-button');
    const itemMenuButton = document.getElementById('item_menu-button');
    const menu = document.querySelector('[aria-labelledby="menu-button"]');
    const diagnosisMenu = document.querySelector('[aria-labelledby="diagnosis_menu-button"]');
    const itemMenu = document.querySelector('[aria-labelledby="item_menu-button"]');

    if (menuButton && menu) {
        menu.style.display = 'none';
        menuButton.addEventListener('click', (event) => {
            menu.style.display = (menu.style.display === 'none') ? 'block' : 'none';
            event.stopPropagation();
        });
    };

    if (diagnosisMenuButton && diagnosisMenu) {
        diagnosisMenu.style.display = 'none';
        diagnosisMenuButton.addEventListener('click', (event) => {
            diagnosisMenu.style.display = (diagnosisMenu.style.display === 'none') ? 'block' : 'none';
            event.stopPropagation();
        });
    };

    if (itemMenuButton && itemMenu) {
        itemMenu.style.display = 'none';
        itemMenuButton.addEventListener('click', (event) => {
            itemMenu.style.display = (itemMenu.style.display === 'none') ? 'block' : 'none';
            event.stopPropagation();
        });
    }

    document.addEventListener('click', () => {
        if (menu) menu.style.display = 'none';
        if (diagnosisMenu) diagnosisMenu.style.display = 'none';
        if (itemMenu) itemMenu.style.display = 'none';
    });
});