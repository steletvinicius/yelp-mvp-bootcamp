# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database'

Restaurant.destroy_all

puts 'Database is clean'

puts 'Creating restaurants'

10.times do
  restaurant = Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    category: %w[chinese italian japanese french belgian].sample,
    phone_number: Faker::PhoneNumber.phone_number
  )
  puts "#{restaurant.id}-#{restaurant.name}-#{restaurant.category}-#{restaurant.phone_number} created"

  5.times do
    review = Review.create(
      restaurant_id: restaurant.id,
      rating: rand(0..5),
      content: Faker::Quote.yoda
    )
    puts "#{review.id}-#{review.rating}-#{review.content}created"
  end
end
