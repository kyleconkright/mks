# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create([
	{name: "Sarah", username: "bumblinround",  profile_image: "https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAIEAAAAJDZkYjJhMjExLTZlMzQtNGQxYy04MGU4LTllMjRiNGVjZmVlNg.jpg", email: "sarah.kruberg@gmail.com", phone_number: "555-555-1234", password_digest: "", street1: "123 Main", street: "4B", city: "Santa Monica", state: "Ca", zip: "90405"}
	])
     