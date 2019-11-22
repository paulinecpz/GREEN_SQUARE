# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts("deleting gardens")


Booking.destroy_all
Review.destroy_all
Garden.destroy_all
User.destroy_all

User.create(name: "Paulo", email:"paulo@paulo.com", password:"password", admin: true)
User.create(name: "Pauline", email:"pauline@pauline.com", password:"password", admin: true)
User.create(name: "Mathieu", email:"mathieu@mathieu.com", password:"password", admin: true)
User.create(name: "Eduardo", email:"edu@edu.com", password:"password", admin: true)


# users= [user1, user2, user3, user4]
puts("creating gardens and users")

USERS = []
15.times do
    USERS << User.create!(
      email: Faker::Internet.email,
      name: Faker::Name.name,
      password: "password",
      remote_avatar_url: Faker::Avatar.image,
      admin: false
      )
  end
  ids = []
  User.all.each { |user| ids << user.id  }

  images = ["1.jpg","2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg", "12.jpg", "13.jpg", "15.jpg", "16.jpg", "18.jpg", "19.jpg","20.jpg", "21.jpg", "22.jpg" ]

  20.times do
    Garden.create!(name: Faker::Cannabis.buzzword,
      address: Faker::Address.city,
      description: Faker::Lorem.paragraph,
      price_per_day: Faker::Number.within(range: 5..20),
      photo: images.sample,
      user_id: ids.sample
      )
  end





puts("seed finished")
