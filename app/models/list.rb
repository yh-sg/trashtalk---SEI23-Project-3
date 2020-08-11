class List < ApplicationRecord
  attr_accessor :travel_distance, :travel_time
  geocoded_by :address
  after_validation :geocode

  def full_address
    return [address, "Singapore", "Singapore"].compact.join(', ')
  end 

  validates :address, :presence => true,
  :length => { :minimum => 5 }
  validates :pickUpDate, :presence => true

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
