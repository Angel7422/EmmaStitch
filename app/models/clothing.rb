class Clothing < ApplicationRecord
  has_many :bookings
  has_many :order
end
