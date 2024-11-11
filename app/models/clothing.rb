class Clothing < ApplicationRecord
  has_many :bookings
  belongs_to :user
  # has_many :orders
end

# belongs to order
# faire une migration pour enlever le order_id de la table clothing
# faire nouvelle migration pour ajouter un nouvel user dans la table clothing
# après la 2ème migration je decomente has many orders.
