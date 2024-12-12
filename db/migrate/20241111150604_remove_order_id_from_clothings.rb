class RemoveOrderIdFromClothings < ActiveRecord::Migration[7.1]
  def change
    remove_column :clothings, :order_id, :bigint
  end
end
