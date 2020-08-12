class Message < ApplicationRecord

    validates_presence_of :content
    belongs_to :user
    validates :content, presence: true
    scope :for_display, -> { order(:created_at).last(50) }
  
    # after_create_commit { MessageBroadcastJob.perform_later(self) }

end
