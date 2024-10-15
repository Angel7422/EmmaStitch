class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :clothing_id
      t.string :status
      t.date :reservation_date
      t.date :modification_date
      t.text :notes

      t.timestamps
    end
  end
end
