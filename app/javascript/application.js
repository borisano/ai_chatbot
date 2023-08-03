// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"

import { Turbo, cable } from "@hotwired/turbo-rails";
import "controllers"

document.addEventListener("turbo:load", () => {
    const conversationFrame = document.getElementById("conversation");
    conversationFrame.addEventListener("turbo:submit-end", () => {
        conversationFrame.scrollTo(0, conversationFrame.scrollHeight);
    });

    Turbo.visit("/conversations");
});