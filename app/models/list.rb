class List < ApplicationRecord
  validates :address, :presence => true,
  :length => { :minimum => 5 }

  validate :pickupdate_cannot_be_in_the_past

  belongs_to :user
  has_many :types
  accepts_nested_attributes_for :types

  def pickupdate_cannot_be_in_the_past
    if pickUpDate.present? && pickUpDate < Date.today
      errors.add(:pickUpDate, "can't be in the past")
    end
  end  
end
