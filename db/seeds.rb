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
  state: "Colorado",
  email: Faker::Internet.email,
  phone: Faker::Number.number(10),
  password_digest: "password"
})

Coach.create!({
  name: Faker::Name.name,
  team: 'Team B',
  age_group: '12U',
  state: "Colorado",
  email: Faker::Internet.email,
  phone: Faker::Number.number(10),
  password_digest: "password"

})

Coach.create!({
  name: Faker::Name.name,
  team: 'Team C',
  age_group: '12U',
  state: "Colorado",
  email: Faker::Internet.email,
  phone: Faker::Number.number(10),
  password_digest: "password"

})

Practice.destroy_all

20.times do |i|
  date = Faker::Date.forward(7)
  Practice.create!({
    coach_id: 1 + rand(3),
    day_of_week: date.strftime('%A'),
    time: '8:00pm',
    duration: '2 hours',
    guest_coach_id: nil,
    team_name: Faker::Team.name,
    location: Faker::Address.street_address,
    date: date,
    age_group: '12U',
    state: "Colorado"
  })
end

EventRecurrence.destroy_all

EventRecurrence.create!({
  coach_id: 1,
  end_date: 6.months.from_now,
  day_of_week: 'monday'
})

puts "DONE!"
