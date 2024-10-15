class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.string :name
      t.integer :rating
      t.text :comment

      t.timestamps
    end
  end
end
