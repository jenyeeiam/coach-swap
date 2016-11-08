# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Seeding Data ..."

Coach.destroy_all

Coach.create!({
  name: Faker::Name.name,
  team: 'Team A',
  age_group: '12U',
  email: Faker::Internet.email,
  phone: Faker::Number.number(10),
  password_digest: "password"
})

Coach.create!({
  name: Faker::Name.name,
  team: 'Team B',
  age_group: '12U',
  email: Faker::Internet.email,
  phone: Faker::Number.number(10),
  password_digest: "password"

})

Coach.create!({
  name: Faker::Name.name,
  team: 'Team C',
  age_group: '12U',
  email: Faker::Internet.email,
  phone: Faker::Number.number(10),
  password_digest: "password"

})

Practice.destroy_all

Practice.create!({
  coach_id: 1,
  date: Faker::Date.forward(7),
  guest_coach_id: 2,
  location: Faker::Address.street_address
})

Practice.create!({
  coach_id: 2,
  date: Faker::Date.forward(7),
  guest_coach_id: 3,
  location: Faker::Address.street_address
})

Practice.create!({
  coach_id: 3,
  date: Faker::Date.forward(7),
  guest_coach_id: 1,
  location: Faker::Address.street_address
})

puts "DONE!"
