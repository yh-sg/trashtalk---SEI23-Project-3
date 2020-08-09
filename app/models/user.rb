class User < ApplicationRecord
  has_one_attached :user_image

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:user, :recycler, :admin] # collector = user
  after_initialize :set_default_role, :if => :new_record?

  has_many :lists
  
  def set_default_role
    self.role ||= :user
  end
end
