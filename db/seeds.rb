# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# create user
user = User.create!(email: 'user1@email.com', password: '12345678', password_confirmation: '12345678')
p user


#create teams
team = user.teams.create!(name: 'team 1')
team = user.teams.create!(name: 'team 2')
team = user.teams.create!(name: 'team 3')
p team

# create monsters

monster = user.monsters.create!(name: 'pikaczu', power: 100, type: 'Electric')
monster = user.monsters.create!(name: 'godzilla', power: 200, type: 'Water')

# #assign monster to team
monster.update_attributes(team: team)
