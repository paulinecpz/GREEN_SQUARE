# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts("deleting gardens")

Garden.destroy_all
User.destroy_all


user1 = User.create(name: "Paulo", email:"paulo@paulo.com", password:"password")
user2 = User.create(name: "Pauline", email:"pauline@pauline.com", password:"password")
user3 = User.create(name: "Mathieu", email:"mathieu@mathieu.com", password:"password")
user4 = User.create(name: "Eduardo", email:"edu@edu.com", password:"password")


users= [user1, user2, user3, user4]
puts("creating gardens")

  10.times do
    Garden.create!(name: Faker::Name.two_word_name,
      address: Faker::Address.city,
      description: Faker::Lorem.sentence,
      price_per_day: Faker::Number.within(range: 100..200),
      user: users.sample
      )
  end

puts("gardens finished")
