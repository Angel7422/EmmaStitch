class AddUserIdToClothings < ActiveRecord::Migration[7.1]
  def change
    add_reference :clothings, :user, foreign_key: true, null: true
  end
end
