require 'faker'

FactoryBot.define do
  factory :purchase do
    order { association :order }
    product { association :product }
  end
end
