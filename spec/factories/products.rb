require 'faker'

FactoryBot.define do
  factory :product do
    description { 'Large-box' }
    price { 2 }
    deadline { Date.today }
    association :business
  end
end
