# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
taco = Restaurant.create(name: "Taco Bell", address: "9000 Yonge St", image_url: "http://www.games-answers.com/wp-content/uploads/icon-pop-quiz-brand/TacoBell.jpg")
burger = Restaurant.create(name: "Burger King", address: "9001 Yonge St", image_url: "http://www.games-answers.com/wp-content/uploads/icon-pop-quiz-brand/BurgerKing.jpg")
me = User.create(first_name: "Tyler", last_name: "Dewald", email: "dewaldo0@gmail.com", password: "newuser", password_confirmation: "newuser")
Reservation.create(user_id: me.id, restaurant_id: taco.id, party_size: 1, time: DateTime.now)
Reservation.create(user_id: me.id, restaurant_id: burger.id, party_size: 5, time: DateTime.now)