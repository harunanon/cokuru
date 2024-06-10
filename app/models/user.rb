class User < ApplicationRecord
  has_many :reservations
  has_many :coworking_spaces, through: :reservations
end