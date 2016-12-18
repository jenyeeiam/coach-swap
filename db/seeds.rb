# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Seeding Data ..."

Practice.destroy_all
Coach.destroy_all
User.destroy_all


User.create!({
  email: "email@example.com",
  password: "password"
})

User.create!({
 email: "email2@example.com",
 password: "password"
})

Coach.create!({
  name: "Billy Bob",
  user_id: User.find_by(email: "email@example.com").id,
  team: 'An Example Team',
  age_group: '12U',
  state: "Colorado",
  email: "email@example.com",
  phone: Faker::Number.number(10)
})
Coach.create!({
  name: "Sally Sal",
  user_id: User.find_by(email: "email2@example.com").id,
  team: 'A Second Example Team',
  age_group: '12U',
  state: "Colorado",
  email: "email2@example.com",
  phone: Faker::Number.number(10)
})

25.times do |i|
  date = Faker::Date.forward(7)
  Practice.create!({
     coach_id: Coach.find_by(name: "Sally Sal").id,
     time: '8:00pm',
     duration: '2 hours',
     guest_coach_id: nil,
     team_name: Faker::Team.name,
     city: Faker::Address.city,
     street: Faker::Address.street_address,
     zipcode: Faker::Address.zip_code,
     date: date,
     age_group: '12U',
     state: "Colorado"
 })
end

puts "DONE!"
