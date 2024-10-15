class CreateOrdersManagements < ActiveRecord::Migration[7.1]
  def change
    create_table :orders_managements do |t|
      t.integer :order_id
      t.string :status
      t.string :priority
      t.date :start_date
      t.date :end_date
      t.text :notes
      t.date :last_updated
      t.string :is_urgent
      t.text :task_list

      t.timestamps
    end
  end
end
