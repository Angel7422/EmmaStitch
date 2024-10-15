class AddMissingIndexesAndForeignKeys < ActiveRecord::Migration[7.1]
  def change
        # Ajout de la clé étrangère et de l'index pour `order_id` dans `orders_managements`
        add_foreign_key :orders_managements, :orders
        add_index :orders_managements, :order_id

        # Si tu souhaites ajouter une relation entre `reviews` et `clothings`
        add_reference :reviews, :clothing, foreign_key: true

        # Assurez-vous que toutes les clés étrangères utilisent le même type de données
        change_column :orders_managements, :order_id, :bigint
        change_column :orders, :user_id, :bigint
        change_column :orders, :clothing_id, :bigint
  end
end
