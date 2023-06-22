require 'rails_helper'

RSpec.describe ChatroomsController, type: :controller do
  let(:current_user) { create(:user) }

  before do
    allow(controller).to receive(:current_user).and_return(current_user)
  end

  describe 'POST #create' do
    it 'does not permit other attributes' do
      params = { chatroom: { name: 'Test', user_id: 1, other: 'Value' } }
      expect(controller).not_to permit(:other).for(:create, verb: :post).on(params: params)
    end
  end
end
