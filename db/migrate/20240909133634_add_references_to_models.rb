class AddReferencesToModels < ActiveRecord::Migration[7.1]
  def change
    # Ajouter des références à `clothings`
    add_reference :clothings, :order, foreign_key: true

    # Ajouter des références à `orders_managements`
    add_reference :orders_managements, :user, foreign_key: true

    # Ne pas ajouter de colonnes déjà existantes à `reviews`
    # add_reference :reviews, :user, foreign_key: true
  end
end
