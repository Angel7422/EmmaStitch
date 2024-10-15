class CreateClothings < ActiveRecord::Migration[7.1]
  def change
    create_table :clothings do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.string :available_sizes
      t.string :category

      t.timestamps
    end
  end
end
