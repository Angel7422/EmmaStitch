class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :clothing_id
      t.integer :quantity
      t.date :order_date
      t.string :delivery_address
      t.text :order_notes
      t.string :status
      t.string :estimated_delivery_date
      t.string :payment_status
      t.integer :booking_id

      t.timestamps
    end
  end
end
