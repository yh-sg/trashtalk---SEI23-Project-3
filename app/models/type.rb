class Type < ApplicationRecord
    belongs_to :list
    
    validates :remarks, presence: true, length: {minimum: 3}
    validates :weight, presence: true, length: {minimum: 1}
end
