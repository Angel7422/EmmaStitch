class DropOrdersManagements < ActiveRecord::Migration[7.1]
  def change
    drop_table :orders_managements
  end
end
