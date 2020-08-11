class Message < ApplicationRecord

    validates_presence_of :content
  
    # after_create_commit { MessageBroadcastJob.perform_later(self) }

end
