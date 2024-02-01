import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        this.element.addEventListener('submit', () => {
        this.showLoadingModal()
        })
    }

    showLoadingModal() {
        const loadingModal = document.getElementById('loadingModal')
        if (loadingModal) {
        loadingModal.classList.remove('hidden')
        }
    }
}