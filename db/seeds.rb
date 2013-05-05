# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create([{username: 'dan', email: 'dmcnamara1@gmail.com', password: 'dicksdicks', password_confirmation: 'dicksdicks'}, {username: 'austen', email: 'plasmarobo@gmail.com', password: 'dicksdicks', password_confirmation: 'dicksdicks'}])

elias = {
		user_id: 2,
		name: "Elias",
		programset_id: 1,
		skillset_id: 1,
		condition: 6,
		stun: 6
}
Programset.create()
Skillset.create()

Player.create(elias)

