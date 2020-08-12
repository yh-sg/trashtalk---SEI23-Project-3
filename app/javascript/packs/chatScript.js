import consumer from "../channels/consumer.js";

consumer.subscriptions.create(
  { channel: "RoomChannel", room: "RoomChannel" },
  {
    connected() {
      console.log("connected");
      const chatInputEl = document.getElementById("chatInput");

      chatInputEl.addEventListener("keypress", (e) => {
        const recipientId = e.target.getAttribute("data-recipient-id");
        const message = e.target.value;
        if (e.code == "Enter") {
          console.log("this", e.target.value);
          this.speak(message, recipientId);
          this.received(e.target.value);
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

        $("#messages").append(data["message"]);

      
    //   else {
    //     document.querySelector(
    //       "#notifications"
    //     ).innerHTML = `<a href="/rooms/show?target_user_id=${data.sender.id}"> ${data.sender.username} have sent you a message. </a>`;
    //   }

      // alert("hello")
    },

    speak: function (message, recipientId) {
      console.log("speak,", message, recipientId);
      return this.perform("speak", {
        message: message,
        target_user: recipientId,
      });
    },
  }
);
