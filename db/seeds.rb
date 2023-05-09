# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Purchase.destroy_all
Order.destroy_all
Product.destroy_all
Business.destroy_all
User.destroy_all

User.create(email: "user1@gmail.com", password: "user1@gmail.com", category: "Private person")

business1 = Business.new(address: "Arluno, Milano 20010, Italy", name: "Famila", user: User.first)
business1.save!

business2 = Business.new(address: "Via Tiburtina 655, 00159 Roma Rome, Italy", name: "Eurospin", user: User.first)
business2.save!

business3 = Business.new(address: "Riva Del Carbon, 30124 Venice Venice, Italy", name: "Coop", user: User.first)
business3.save!

business4 = Business.new(address: "Via Giacomo Puccini 30, 20068 Peschiera Borromeo Milan, Italy", name: "Despar", user: User.first)
business4.save!

p1 = Product.new(description: "Small-Box", deadline: Date.tomorrow, co2e: 2.11, price: 2, business_id: business1.id)
p1.photo.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'logo-famila.jpg')), filename: 'logo-famila.jpg', content_type: 'logo-famila.jpg')
p1.save!

p2 = Product.new(description: "Medium-Box", deadline: Date.tomorrow, co2e: 2.50, price: 5, business_id: business2.id)
p2.photo.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'logo-eurospin.jpg')), filename: 'logo-eurospin.jpg', content_type: 'logo-eurospin.jpg')
p2.save!

p3 = Product.new(description: "Medium-Box", deadline: Date.tomorrow, co2e: 2.50, price: 5, business_id: business3.id)
p3.photo.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'logo-coop.jpg')), filename: 'logo-coop.jpg', content_type: 'logo-coop.jpg')
p3.save!

p4 = Product.new(description: "Medium-Box", deadline: Date.tomorrow, co2e: 2.50, price: 5, business_id: business4.id)
p4.photo.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'logo-despar.jpg')), filename: 'logo-despar.jpg', content_type: 'logo-despar.jpg')
p4.save!
