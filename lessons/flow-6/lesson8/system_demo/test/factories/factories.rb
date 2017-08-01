# This will guess the User class
FactoryGirl.define do
  factory :post do
    title Faker::Name.name
    announce Faker::StarWars.quote
    body Faker::StarWars.wookiee_sentence
  end
end