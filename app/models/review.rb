# Class used to identify reviews added by the user
# to a specific product (box)

class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product
end
