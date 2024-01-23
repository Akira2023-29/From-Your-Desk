document.addEventListener('turbo:load', (event) => {
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
            menu.style.display = 'none';
            let isHovering = false;

            const openMenu = () => {
                isHovering = true;
                menu.style.display = 'block';
            };

            const closeMenu = () => {
                isHovering = false;
                setTimeout(() => {
                    if (!isHovering) {
                        menu.style.display = 'none';
                    }
                }, 10);
            };

            button.addEventListener('mouseover', openMenu);
            button.addEventListener('mouseout', closeMenu);
            menu.addEventListener('mouseover', openMenu);
            menu.addEventListener('mouseout', closeMenu);
        }
    };

    toggleMenu(menuButton, menu);
    toggleMenu(diagnosisMenuButton, diagnosisMenu);
    toggleMenu(itemMenuButton, itemMenu);
    toggleMenu(smallMenuButton, smallMenu);

    document.addEventListener('click', () => {
        if (menu) menu.style.display = 'none';
        if (diagnosisMenu) diagnosisMenu.style.display = 'none';
        if (itemMenu) itemMenu.style.display = 'none';
        if (smallMenu) smallMenu.style.display = 'none';
    });
});
