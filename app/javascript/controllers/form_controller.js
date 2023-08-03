import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    handleTurboFormSubmission(event) {
        const form = event.target;

        if (form.classList.contains("js-turbo-form")) {
            form.reset();
        }
    }
}