class Order < ApplicationRecord
  has_many :orders_management
  has_many :clothings
end
