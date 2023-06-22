require 'faker'

FactoryBot.define do
  factory :order do
    state { 'pending' }
    total_price { 2 }
    user { association :user }
  end
end
