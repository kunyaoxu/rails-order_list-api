# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |x|
  Product.create(
    name: "item no.#{x + 1}",
    sold: 0,
    inventory: 10 * x + 2,
    price: 100 * x + 50,
    description: "item no.#{x + 1} description ..."
  )
end
