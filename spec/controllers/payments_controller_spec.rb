require 'rails_helper'

# RSpec.describe PaymentsController, type: :controller do
#   describe 'GET #new' do
#     context 'when the user has no pending orders' do
#       let(:user) { create(:user) }

#       before do
#         allow(controller).to receive(:current_user).and_return(user)
#         get :new
#       end

#       it 'creates a new order for the user' do
#         expect(assigns(:order).state).to eq('pending')
#       end
#     end

#     context 'when the user has a pending order' do
#       let(:user) { create(:user) }
#       let(:order) { create(:order, user: user, state: 'pending') }

#       before do
#         allow(controller).to receive(:current_user).and_return(user)
#         get :new, params: { order_id: order.id }
#       end

#       it 'finds the pending order for the user' do
#         expect(assigns(:order)).to eq(order)
#       end
#     end
#   end
# end
