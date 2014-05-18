require 'faker'

FactoryGirl.define do
  factory :account do
    name { "#{Faker::Company.name} salary" }
  end
end



# # This will guess the User class
# FactoryGirl.define do
#   factory :user do
#     first_name "John"
#     last_name  "Doe"
#     admin false
#   end
