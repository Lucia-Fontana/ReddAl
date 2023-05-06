class Product < ApplicationRecord
  belongs_to :business
  has_many :purchases, dependent: :destroy
  validates :description, presence: true
  validates :price, presence: true
  validates :deadline, presence: true
  has_one_attached :photo
  acts_as_favoritable
  # monetize :price
end
