class Order < ApplicationRecord
  belongs_to :user
  has_many :purchases, dependent: :destroy
  has_many :products, through: :purchases
end
