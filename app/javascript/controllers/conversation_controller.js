import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    connect() {
        this.subscription = this.data.get("subscription");
        this.channel = this.data.get("channel");

        if (this.channel) {
            this.subscription = this.createSubscription();
        }
    }

    createSubscription() {
        return this.stimulate("ConversationChannel#create", {
            channel: this.channel,
        });
    }
}