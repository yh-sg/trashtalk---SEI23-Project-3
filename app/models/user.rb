class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:user, :recycler, :admin] # collector = user
  after_initialize :set_default_role, :if => :new_record?

  has_many :lists
  
  def set_default_role
    self.role ||= :user
  end
end
