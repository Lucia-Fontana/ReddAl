# Class that identifies a purchase, that is a box added to the basket
# it belongs to an order and refers to a specific product

class Purchase < ApplicationRecord
  belongs_to :order
  belongs_to :product
  # has_many :businesses, through: :products
end
