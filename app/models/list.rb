class List < ApplicationRecord
  belongs_to :user
  has_many :types
  accepts_nested_attributes_for :types
end