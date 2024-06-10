class User < ApplicationRecord
  has_many :reservations
  has_many :coworking_spaces, through: :reservations

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, 
  validates :password_digest, presence: true
end