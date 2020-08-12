import consumer from "./consumer.js";

consumer.subscriptions.create(
  { channel: "RoomChannel", room: "RoomChannel" },
  {
    connected() {
      console.log("connected");

      const chatInputEl = document.getElementById("chatInput");

      chatInputEl.addEventListener("keypress", (e) => {
        if (e.code == "Enter") {
          console.log("this", e.target.value);
          this.speak(e.target.value);
          this.received(e.target.value)
        }
      });
    },

    disconnected() {
      console.log("disconnected");

      // Called when the subscription has been terminated by the server
    },

    received(data) {
      // Called when there's incoming data on the websocket for this channel
      console.log(data);
      $("#messages").append(data['message']);

      // alert("hello")
    },

    speak: function (data) {
      console.log("speak,", data);
      return this.perform("speak", { message: data, target_user: "recycler" });
    },
  }
);



