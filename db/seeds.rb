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
# Chatroom.destroy_all
Message.destroy_all
User.destroy_all
# Reviews.destroy_all

# Chatroom.create(name: "Servizio clienti")

User.create(username: "Silvana", email: "silvana@gmail.com", password: "user@gmail.com", category: "Utente", Isee: 20, nucleo: 3)
User.create(username: "Famila", email: "info@famila.com", password: "info@famila.com", category: "Attività")
User.create(username: "Eurospin", email: "info@eurospin.com", password: "info@eurospin.com", category: "Attività")
User.create(username: "Coop", email: "info@coop.com", password: "info@coop.com", category: "Attività")

business1 = Business.new(address: "Arluno, Milano 20010, Italy", name: "Famila", user: User.second)
business1.save!

business2 = Business.new(address: "Via Tiburtina 655, 00159 Roma Rome, Italy", name: "Eurospin", user: User.second)
business2.save!

business3 = Business.new(address: "Riva Del Carbon, 30124 Venice Venice, Italy", name: "Coop", user: User.second)
business3.save!

business4 = Business.new(address: "Via Giacomo Puccini 30, 20068 Peschiera Borromeo Milan, Italy", name: "Despar", user: User.second)
business4.save!

p1 = Product.new(description: "Small-Box", deadline: Date.tomorrow, co2e: 2.10, price: 2, size: 1, note: "1kg pasta, 1l olio", business_id: business1.id)
p1.photo.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'logo-famila.jpg')), filename: 'logo-famila.jpg', content_type: 'logo-famila.jpg')
p1.save!

p2 = Product.new(description: "Medium-Box", deadline: Date.tomorrow, co2e: 2.50, price: 5, size: 3, note: "2kg pasta, 1l olio", business_id: business2.id)
p2.photo.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'logo-eurospin.jpg')), filename: 'logo-eurospin.jpg', content_type: 'logo-eurospin.jpg')
p2.save!

p3 = Product.new(description: "Medium-Box", deadline: Date.tomorrow, co2e: 2.50, price: 5, size: 3, note: "3kg riso, 1l olio", business_id: business3.id)
p3.photo.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'logo-coop.jpg')), filename: 'logo-coop.jpg', content_type: 'logo-coop.jpg')
p3.save!

p4 = Product.new(description: "Medium-Box", deadline: Date.tomorrow, co2e: 2.50, price: 5, size: 3, note: "3kg riso, 3l salsa", business_id: business4.id)
p4.photo.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'logo-despar.jpg')), filename: 'logo-despar.jpg', content_type: 'logo-despar.jpg')
p4.save!

p5 = Product.new(description: "Medium-Box", deadline: Date.tomorrow, co2e: 2.10, price: 5, size: 3, note: "2kg pasta, 3l salsa", business_id: business1.id)
p5.photo.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'logo-famila.jpg')), filename: 'logo-famila.jpg', content_type: 'logo-famila.jpg')
p5.save!
