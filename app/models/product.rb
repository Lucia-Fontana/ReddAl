# Class used to create and manage products (each box is a product)
# it must have a description, a price and a deadline, is created
# by a business and can have one or more reviews

class Product < ApplicationRecord
  validates :description, presence: true
  validates :price, presence: true
  validates :deadline, presence: true

  belongs_to :business
  has_one_attached :photo
  has_many :purchases, dependent: :destroy
  has_many :reviews
  acts_as_favoritable
end
