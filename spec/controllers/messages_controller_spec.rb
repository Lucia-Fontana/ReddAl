require 'rails_helper'

# RSpec.describe MessagesController, type: :controller do
#   let(:user) { create(:user) }
#   let(:participant) { create(:participant) }
#   let(:chatroom) { create(:chatroom) }

#   before(:each) do
#     sign_in user
#   end

#   describe "POST #create" do
#     context "with valid parameters" do
#       let(:valid_params) { { chatroom_id: chatroom.id, message: { content: "Hello, world!" } } }

#       it "creates a new message" do
#         user = create(:user)
#         sign_in(user)
#         expect {
#           post :create, params: valid_params
#         }.to change(Message, :count).by(1)
#       end

#       it "assigns the current user as the message's user" do
#         post :create, params: valid_params
#         expect(Message.last.user).to eq(user)
#       end

#       it "assigns the specified chatroom as the message's chatroom" do
#         post :create, params: valid_params
#         expect(Message.last.chatroom).to eq(chatroom)
#       end

#       it "broadcasts the new message to the chatroom channel" do
#         expect {
#           post :create, params: valid_params
#         }.to have_broadcasted_to(chatroom)
#       end

#       it "returns a successful response" do
#         post :create, params: valid_params
#         expect(response).to have_http_status(:ok)
#       end
#     end

#     context "with invalid parameters" do
#       let(:invalid_params) { { chatroom_id: chatroom.id, message: { content: "" } } }

#       it "does not create a new message" do
#         expect {
#           post :create, params: invalid_params
#         }.not_to change(Message, :count)
#       end

#       it "returns an error response" do
#         post :create, params: invalid_params
#         expect(response).to have_http_status(:unprocessable_entity)
#       end
#     end
#   end
# end
