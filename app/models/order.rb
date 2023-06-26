# Class that identifies orders, an order is created
# everytime a product is added to an empty basket
# by an end user (whose categoria == Utente)
# every item added to the basket is a purchase

class Order < ApplicationRecord
  belongs_to :user
  has_many :purchases, dependent: :destroy
  has_many :products, through: :purchases
  # monetize :total_price
end
