# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Creating user'
user = FactoryBot.create(:user, email: 'mike@example.com')

puts 'Creating notes'
35.times { FactoryBot.create(:note, user: user) } if Note.count.zero?
