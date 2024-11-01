class DropClothingsTable < ActiveRecord::Migration[7.1]
  def change
    drop_table :clothings, if_exists: true
  end
end
