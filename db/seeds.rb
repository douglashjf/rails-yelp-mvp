# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Clearing old data..."
Restaurant.destroy_all
Review.destroy_all

puts "Creating some restaurants..."

restaurants_data = [
  {
    name: 'Ninja Sushi',
    address: '123 Japan Street',
    phone_number: '1231823 1283',
    category: 'japanese'
  },
  {
    name: 'Golden Dynasty',
    address: '123 Peking Street',
    phone_number: '112233 1283',
    category: 'chinese'
  },
  {
    name: 'Il Romano',
    address: '12 Boselli Drive',
    phone_number: '1123333 1283',
    category: 'italian'
  },
  {
    name: 'Le Baguette',
    address: '22 Rue de Paris',
    phone_number: '3333',
    category: 'french'
  },
  {
    name: 'Chocolate Lane',
    address: '111 Congo Street',
    phone_number: '3333 2312',
    category: 'belgian'
  }
]

restaurants_data.each do |restaurant_seed|
  restaurant = Restaurant.create!(restaurant_seed)
  puts "creating review for #{restaurant.name}"

  3.times do
    Review.create!(
      content: "randomly generated text",
      rating: rand(0..5),
      restaurant: restaurant
    )
  end
end

puts "Seeding completed!"
