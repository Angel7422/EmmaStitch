class AddForeignKeysToBookingsAndOrders < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :bookings, :users, column: :user_id
    add_foreign_key :bookings, :clothings, column: :clothing_id
    add_foreign_key :orders, :users, column: :user_id
    add_foreign_key :orders, :clothings, column: :clothing_id
  end
end
