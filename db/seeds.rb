# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
  Ingredient.create(name: "lemon")
  Ingredient.create(name: "ice")
  Ingredient.create(name: "mint leaves")
  Ingredient.create(name: "rum")
  Ingredient.create(name: "gin")
  Ingredient.create(name: "vodka")
  Ingredient.create(name: "cola")

require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail'
items_serialized = open(url).read
items = JSON.parse(items_serialized)["drinks"]
items.each do |item|
  Cocktail.create( name: item["strDrink"], photo: item["strDrinkThumb"] )
end
