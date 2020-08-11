class Conversation < ApplicationRecord
    has_many :messages
    has_and_belongs_to_many :users,
        association_foreign_key: "user_id",
        foreign_key: "conversation_id"
end
