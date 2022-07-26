require 'faker'


puts "Cleaning the database"

Freelancer.destroy_all 
User.destroy_all 

puts "Creating Users & freelancers"


30.times do
  user = User.create(
   first_name: Faker::Name.unique.name,
   last_name: Faker::Ancient.titan,
   email: Faker::Internet.email,
   password: "123456")
 
   freelancer = Freelancer.create(bio: Faker::Lorem.paragraphs.join,
     rate: rand(0..500),
     feature: false,
     user: user
   )
 end


30.times do
 user = User.create(
  first_name: Faker::Name.unique.name,
  last_name: Faker::Ancient.titan,
  email: Faker::Internet.email,
  password: "123456")

  freelancer = Freelancer.create(bio: Faker::Lorem.paragraphs.join,
    rate: rand(0..500),
    feature: true,
    user: user
  )
end


 10.times do 
  user = User.create(
    first_name: Faker::Name.unique.name,
    last_name: Faker::Ancient.titan,
    email: Faker::Internet.email,
    password: "123456") 
 end

puts "Done!"