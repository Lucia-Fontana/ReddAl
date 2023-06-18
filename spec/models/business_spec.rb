require 'rails_helper'

RSpec.describe Business, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:products) }
  it { should have_many(:purchases).through(:products) }
end
