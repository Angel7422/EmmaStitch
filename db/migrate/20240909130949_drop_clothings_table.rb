class DropClothingsTable < ActiveRecord::Migration[7.1]
  def change
    drop_table :clothings
  end
end
