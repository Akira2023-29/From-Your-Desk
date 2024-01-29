document.addEventListener('turbo:load', setupMenus);
document.addEventListener('turbo:render', setupMenus);

// setupMenus関数を作成
function setupMenus() {
    const menuButton = document.getElementById('menu-button');
    const diagnosisMenuButton = document.getElementById('diagnosis_menu-button');
    const itemMenuButton = document.getElementById('item_menu-button');
    const smallMenuButton = document.getElementById('small_menu-button');

    const menu = document.querySelector('[aria-labelledby="menu-button"]');
    const diagnosisMenu = document.querySelector('[aria-labelledby="diagnosis_menu-button"]');
    const itemMenu = document.querySelector('[aria-labelledby="item_menu-button"]');
    const smallMenu = document.querySelector('[aria-labelledby="small_menu-button"]');

    const toggleMenu = (button, menu) => {
        if (button && menu) {
            let isOpen = false;
            menu.style.display = 'none';

            const openMenu = () => {
                isOpen = true;
                menu.style.display = 'block';
            };

            const closeMenu = () => {
                isOpen = false;
                menu.style.display = 'none';
            };

            button.addEventListener('click', () => {
                if (isOpen) {
                    closeMenu();
                } else {
                    openMenu();
                }
            });

            document.addEventListener('click', (event) => {
                if (!button.contains(event.target) && !menu.contains(event.target)) {
                    closeMenu();
                }
            });
        }
    };

    toggleMenu(menuButton, menu);
    toggleMenu(diagnosisMenuButton, diagnosisMenu);
    toggleMenu(itemMenuButton, itemMenu);
    toggleMenu(smallMenuButton, smallMenu);
}