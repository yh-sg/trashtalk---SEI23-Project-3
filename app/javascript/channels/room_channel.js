import consumer from "./consumer"

consumer.subscriptions.create({ channel: "RoomChannel", room: "RoomChannel" }, {
  connected() {
    console.log("connected")
    // Called when the subscription is ready for use on the server
    this.speak("something")
  },

  disconnected() {
    console.log("disconnected")

    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    console.log("received")

  },

  speak: function(data) {
    return this.perform('speak',{message:data, target_user:"recycler"});
  }
});
