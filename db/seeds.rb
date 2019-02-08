# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


2.times do
  user = User.new
  user.email = Faker::Internet.email
  user.role = 'applicant'
  user.password = Faker::Lorem.characters(10)
  user.encrypted_password = Faker::Lorem.characters(10)
  user.save!

  Applicant.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, user_id: user.id)
end

3.times do
  user = User.new
  user.email = Faker::Internet.email
  user.role = 'employer'
  user.password = Faker::Lorem.characters(10)
  user.encrypted_password = Faker::Lorem.characters(10)
  user.save!

  employer = Employer.create(name: Faker::Company.name, user_id: user.id)
  Job.create(title: Faker::Job.title, description: Faker::Company.bs, employer_id: employer.id)
end
