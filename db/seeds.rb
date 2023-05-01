# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Product.destroy_all
Business.destroy_all
User.destroy_all

User.create(email: "user1@gmail.com", password: "user1@gmail.com", category: "Private person")

business1 = Business.new(address: "Via dei Torriani n. 21, Gorizia", name: "Famila", user: User.first)
business1.save!

p1 = Product.new(description: "Small-Box", deadline: Date.tomorrow, co2e: 2.11, price: 2, business_id: business1.id)
# p1.photo.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'products', 'famila.jpg')), filename: 'famila.jpg', content_type: 'famila.jpg')
p1.save!
