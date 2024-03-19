# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts 'Cleaning database...'
Restaurant.destroy_all

puts 'Creating Fake restaurants'
5.times do
  restaurant = Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    category: %w[chinese italian japanese french belgian].sample
  )
  puts "Created #{restaurant.name}, a wonderful #{restaurant.category} restaurant, located at #{restaurant.address}."

  rand(1..5).times do
    review = Review.create!(
      content: Faker::Restaurant.review,
      rating: rand(6),
      restaurant_id: restaurant.id
    )
    puts "Review of #{review.rating}/5 given to #{restaurant.name} with following details :"
    puts review.content
  end
end

puts 'Done with Faking restaurants!'
