# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Kitten.delete_all

Kitten.create(name: 'Kitty', age: 3, cuteness: 'adorable', softness: 'fluffy')
Kitten.create(name: 'Tommy', age: 2, cuteness: 'average', softness: 'very fluffy')
Kitten.create(name: 'Edward', age: 1, cuteness: 'extremely cute', softness: 'average')
Kitten.create(name: 'Peter', age: 2, cuteness: 'adorable', softness: 'very fluffy')
Kitten.create(name: 'Chris', age: 3, cuteness: 'average', softness: 'fluffy')
Kitten.create(name: 'Rachael', age: 1, cuteness: 'adorable', softness: 'average')
Kitten.create(name: 'Stephen', age: 2, cuteness: 'average', softness: 'average')
