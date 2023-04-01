class Purchase < ApplicationRecord
  belongs_to :order
  belongs_to :product
  has_many :businesses, through: :products
end
