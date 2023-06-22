require 'faker'

FactoryBot.define do
  factory :chatroom do
    name { 'Example Chatroom' }
    user_id { 1 }
  end
end
