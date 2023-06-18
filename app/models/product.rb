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
