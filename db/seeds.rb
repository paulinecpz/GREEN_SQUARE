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

puts("creating gardens and users")
User.create(name: "Paulo Marques", email:"paulo_marques@gmail.com", password:"password", admin: true)
User.create(name: "Pauline Coupez", email:"pauline_coupez@gmail.com", password:"password", admin: true)
User.create(name: "Mathieu Fontaine", email:"mathieu_fontaine@gmail.com", password:"password", admin: true)
User.create(name: "Eduardo Borges", email:"eduardo_borges@gmail.com", password:"password", admin: true)

# users= [user1, user2, user3, user4]
images = ["1.jpg","2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg", "12.jpg", "13.jpg", "15.jpg", "16.jpg", "18.jpg", "19.jpg","20.jpg", "21.jpg", "22.jpg" ]
Garden.create(name: "Jardim Botânico", address: "Calçada Martim de Freitas, Coimbra", description: "A beautiful garden located in the city center of one of the most famous citys in Portugal.", price_per_day: 100, photo: images.sample, user_id: 2)
Garden.create(name: "Jardim d'Ajuda", address: "Calçada da Ajuda, Lisboa", description: "A huge garden with lots of space ideal to grow cool things and for long rents terms", price_per_day: 125, photo: images.sample, user_id: 2)
Garden.create(name: "Estufa Fria", address: "Parque Eduardo VII, Lisboa", description: "Garden with one of the best views in town. Perfect to do whatever you want to.", price_per_day: 155, photo: images.sample, user_id: 2)
Garden.create(name: "Jardim Manuel Bivar", address: "Praça Dom Francisco Gomes, Faro", description: "Elegant brand new garden in Faro. Located near the best beaches in south of Portugal.", price_per_day: 135, photo: images.sample, user_id: 2)
Garden.create(name: "Jardim do Palácio dos Távoras", address: "Largo Igreja, Mirandela", description: "Located outside Mirandela it's the perfect place to throw a party.", price_per_day: 100, photo: images.sample, user_id: 2)
Garden.create(name: "Jardim da Avenida Central", address: "Avenida Central, Braga", description: "Located in a historic city in the north of Portugal. Perfect weather conditions to grow", price_per_day: 120, photo: images.sample, user_id: 2)
Garden.create(name: "Parque do Castelo e Paço dos Duques de Bragança", address: "Rua Conde Dom Henrique, Guimarães", description: "Garnde in the north of Portugal. Perfect weather to grow stuff.", price_per_day: 200, photo: images.sample, user_id: 2)


puts("seed finished")
