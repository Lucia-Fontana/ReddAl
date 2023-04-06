class Business < ApplicationRecord
  has_many :products
  belongs_to :user
  has_many :purchases, through: :products
end
