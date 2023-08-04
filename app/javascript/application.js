// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import { Turbo } from "@hotwired/turbo-rails";

import "controllers"

document.addEventListener("turbo:submit-end", function (event) {
    const frame = event.target.querySelector("turbo-frame");
    if (frame && frame.id === "new-conversation-frame") {
        const newConversationId = frame.firstElementChild.dataset.id;
        const conversationsList = document.getElementById("conversations-frame").firstElementChild;

        if (newConversationId && conversationsList) {
            Turbo.visit(`/conversations/${newConversationId}`, { action: "replace" });
        }
    }
});
// document.addEventListener("turbo:load", () => {
//     const conversationFrame = document.getElementById("messages-frame");
//     conversationFrame.addEventListener("turbo:submit-end", () => {
//         conversationFrame.scrollTo(0, conversationFrame.scrollHeight);
//     });
//
//     const conversationLinks = document.querySelectorAll(".conversation-link");
//     conversationLinks.forEach(link => {
//         link.addEventListener("click", (event) => {
//             event.preventDefault();
//             const conversationId = link.getAttribute("data-conversation-id");
//             Turbo.visit("/conversations/" + conversationId, { action: "replace", target: "messages-frame" });
//         });
//     });
// });