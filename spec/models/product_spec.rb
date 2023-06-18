require 'rails_helper'

# belongs_to :business
# has_many :purchases, dependent: :destroy

# has_one_attached :photo
# has_many :reviews
# acts_as_favoritable


RSpec.describe Product, type: :model do
  # validates :description, presence: true
  it "is not valid without a description" do
    product = Product.new(description: nil)
    expect(product).to_not be_valid
  end

  # validates :description, presence: true
  it "is not valid without a price" do
    product = Product.new(price: nil)
    expect(product).to_not be_valid
  end

  # validates :deadline, presence: true
  it "is not valid without a deadline" do
    product = Product.new(deadline: nil)
    expect(product).to_not be_valid
  end


  # it { should belong_to(:business) }

end
