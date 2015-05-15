User.destroy_all
Order.destroy_all

User.create([
	{name: "Sarah", username: "bumblinround",  profile_image: "https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAIEAAAAJDZkYjJhMjExLTZlMzQtNGQxYy04MGU4LTllMjRiNGVjZmVlNg.jpg", email: "sarah.kruberg@gmail.com", phone_number: "555-555-1234", street1: "123 Main", street2: "4B", city: "Santa Monica", state: "CA", zip: "90405", password: "password"},
	{name: "Laura", username: "kruberg",  profile_image: "https://igcdn-photos-e-a.akamaihd.net/hphotos-ak-xpa1/t51.2885-19/10808444_378957968948860_469603930_a.jpg", email: "laura@example.com", phone_number: "555-555-1234", street1: "123 Main Street", street2: "5B", city: "San Diego", state: "CA", zip: "90405", password: "password"}
	]) 

Order.create{[
	{size: "Small", quantity: "1", status: "Pending", user_id: "1"},
	{size: "Medium", quantity: "3", status: "Completed", user_id: "2"},
	{size: "Large", quantity: "2", status: "Shipped", user_id: "1"},
	{size: "X-Small", quantity: "2", status: "", user_id: "3"}
	]} 
