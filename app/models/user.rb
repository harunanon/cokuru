class User < ApplicationRecord
  has_secure_password
  
  has_many :reservations
  has_many :coworking_spaces, through: :reservations

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password_digest, presence: true
end