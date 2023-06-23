require 'rails_helper'

RSpec.describe User, type: :model do

  it 'is database authenticable' do
    user = User.create(
      email: 'test@example.com',
      password: 'password123',
      password_confirmation: 'password123'
    )
    expect(user.valid_password?('password123')).to be_truthy
  end

  it "is not valid without a email" do
    user = User.new(email: nil)
    expect(user).to_not be_valid
  end

  it "excludes users without an id" do
    non_user = User.create(id: false)
    expect(User.all).not_to include(non_user)
  end

  it { should have_many(:orders) }
  it { should have_one(:business) }
  it { should have_many(:reviews) }
  it { should have_many(:purchases).through(:orders) }
end
