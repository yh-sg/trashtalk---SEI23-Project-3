
class RoomChannel < ApplicationCable::Channel
    # calls when a client connects to the server
    def subscribed
    #   if params[:room_id].present?
        # creates a private chat room with a unique name
        # msg = Message.all
        #stream_for msg
        stream_from "RoomChannel"
    #   end


    end



    
    # calls when a client broadcasts data
    def speak(data)
        puts "speaking"
        puts data
      sender = current_user
    #   target_user   = User.find_by(username: data['target_user'])
      message   = data['message']
      msg = Message.new
      msg.user_id = current_user.id 
      msg.recipient_id = data["target_user"]
      msg.content = data['message']
      puts msg
      msg.save!
      ActionCable.server.broadcast "RoomChannel", {message: message, sender: current_user, recipient: User.find(data["target_user"])}
    #   convo = get_convo(sender,target_user)
    #   puts "convo"
    #   puts convo
    #   puts convo.users

        #  byebug
        #  convo.save!
        # user2 = User.find(username: "collector")
        # byebug
    #   raise 'No room_id!' if room_id.blank?
    #   convo = get_convo(room_id) # A conversation is a room
    #   raise 'No conversation found!' if convo.blank?
    #   raise 'No message!' if message.blank?
  
    #   # adds the message sender to the conversation if not already included
    #   convo.users << sender unless convo.users.include?(sender)
    #   # saves the message and its data to the DB
    #   # Note: this does not broadcast to the clients yet!
    #   Message.create!(
    #     conversation: convo,
    #     sender: sender,
    #     content: message
    #   )
    end
    
    # Helpers
    
    def get_convo(sender,target_user)
        convos = Conversation.includes(:users).where(users: {id: 2})
        puts "hererere"
        convo = convos.find {|c| puts c.users}
        # return convo[0]
    end
    
  end