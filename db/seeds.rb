# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

# Supprime les anciens enregistrements
Clothing.destroy_all
User.destroy_all

admin = User.create!(
  email: 'admin@test.com',
  password: 'password123'
)

# Création d'articles de vêtements
Clothing.create([
  {
    name: 'T-shirt en coton bio',
    description: 'Un T-shirt confortable en coton bio, parfait pour les journées décontractées.',
    price: 20,
    available_sizes: 'S, M, L, XL',
    category: 'Haut'
  },
  {
    name: 'Jean slim',
    description: 'Jean slim en denim de haute qualité, idéal pour un look tendance.',
    price: 40,
    available_sizes: 'S, M, L',
    category: 'Bas'
  },
  {
    name: 'Robe d\'été',
    description: 'Robe légère et fluide, parfaite pour les journées ensoleillées.',
    price: 35,
    available_sizes: 'M, L',
    category: 'Robe'
  },
  {
    name: 'Veste en cuir',
    description: 'Veste en cuir véritable, élégante et durable pour toutes les saisons.',
    price: 100,
    available_sizes: 'M, L, XL',
    category: 'Veste'
  },
  {
    name: 'Baskets confortables',
    description: 'Baskets au style décontracté, idéales pour le sport ou la vie quotidienne.',
    price: 60,
    available_sizes: '38, 39, 40, 41, 42',
    category: 'Chaussures'
  },
  {
    name: 'Chapeau de paille',
    description: 'Chapeau de paille léger pour se protéger du soleil.',
    price: 15,
    available_sizes: 'Unique',
    category: 'Accessoires'
  }
])

puts "Seed completed: #{Clothing.count} articles de vêtements créés."
