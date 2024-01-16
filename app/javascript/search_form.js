document.addEventListener('turbo:load', (event) => {
    const placeSelect = document.querySelector('select[name="q[place_id_eq]"]');
    const placeOptions = Array.from(placeSelect.options);
    const placesByCategory = JSON.parse(placeSelect.dataset.categories);

    document.querySelector('select[name="q[place_category_id_eq]"]').addEventListener('change', (event) => {
        const selectedCategory = event.target.value;

        placeOptions.forEach((option) => {
        if (option.value === '' || placesByCategory[option.value] == selectedCategory) {
            option.hidden = false;
        } else {
            option.hidden = true;
        }
        });

        if (placesByCategory[placeSelect.value] != selectedCategory) {
        placeSelect.value = '';
        }
    });
});  