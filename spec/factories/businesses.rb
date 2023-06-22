require 'faker'

FactoryBot.define do
  factory :business do
    name { 'Famila' }
    association :user
  end
end
