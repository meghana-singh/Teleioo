# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'
  pwd = Faker::Internet.password
  5.times do 
      
  User.create!(
     email:                  Faker::Internet.email,
     password:               pwd,
     password_confirmation:  pwd
  )
  end 
  
  users = User.all
  
  Item.create!(
      user:    users.sample,
      name:    Faker::Name.title
  )

  puts "#{User.count} users created"
  puts "#{User.all}"
  puts "#{Item.count} Items created"
  puts "#{Item.all}"