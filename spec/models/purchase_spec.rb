require 'rails_helper'

RSpec.describe Purchase, type: :model do
  it { should belong_to(:order) }
  it { should belong_to(:product) }
  # it { should have_many(:businesses).through(:products) }
end