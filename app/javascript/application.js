// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"

import { Turbo, cable } from "@hotwired/turbo-rails";
import "controllers"

// document.addEventListener("turbo:load", () => {
//     const conversationFrame = document.getElementById("conversation");
//     conversationFrame.addEventListener("turbo:submit-end", () => {
//         conversationFrame.scrollTo(0, conversationFrame.scrollHeight);
//     });
//
//     Turbo.visit("/conversations");
// });

document.addEventListener("turbo:load", () => {
    // Handle click on any conversation link
    document.addEventListener("click", async (event) => {
        const conversationLink = event.target.closest(".conversation-link");
        if (!conversationLink) return;

        event.preventDefault();

        const url = conversationLink.getAttribute("href");

        // Manually fetch the turbo-stream content
        const response = await fetch(url, { headers: { "Accept": "text/vnd.turbo-stream.html" } });
        const body = await response.text();

        // Replace the messages-frame turbo frame with the fetched content
        const messagesFrame = document.getElementById("messages-frame");
        messagesFrame.outerHTML = body;
    });
});