require 'faker'

FactoryGirl.define do
   factory :item do
     name    Faker::Name.title
   end
 end