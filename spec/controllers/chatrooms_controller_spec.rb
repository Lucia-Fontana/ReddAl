require 'rails_helper'

RSpec.describe ChatroomsController, type: :controller do
  # let(:current_user) { create(:user) }

  # describe "GET #index" do
  #   it "assigns all users except current user to @users" do
  #     other_users = create_list(:user, 3)
  #     allow(controller).to receive(:current_user).and_return(current_user)
  #     get :index

  #     expect(assigns(:users)).to match_array(other_users)
  #     expect(assigns(:users)).not_to include(current_user)
  #   end

  #   it "renders the index template" do
  #     get :index

  #     expect(response).to render_template(:index)
  #   end
  # end

  # describe "GET #show" do
  #   let(:chatroom) { create(:chatroom) }

  #   before do
  #     get :show, params: { id: chatroom.id }
  #   end

  #   it "assigns the requested chatroom to @chatroom" do
  #     expect(assigns(:chatroom)).to eq(chatroom)
  #   end

  #   it "assigns a new message to @message" do
  #     expect(assigns(:message)).to be_a_new(Message)
  #   end

  #   it "renders the show template" do
  #     expect(response).to render_template(:show)
  #   end
  # end

  # describe "private #chatroom_params" do
  #   let(:params) { ActionController::Parameters.new(chatroom: { name: "Example Room", user_id: 1 }) }

  #   it "permits :name and :user_id attributes" do
  #     expect(controller.send(:chatroom_params, params)).to permit(:name, :user_id)
  #   end
  # end

  # describe ".create_private_room" do
  #   let(:users) { create_list(:user, 3) }
  #   let(:chatroom_name) { "Private Room" }

  #   it "creates a new private chatroom" do
  #     expect {
  #       Chatroom.create_private_room(users, chatroom_name)
  #     }.to change(Chatroom, :count).by(1)
  #   end

  #   it "assigns participants to the created chatroom" do
  #     chatroom = Chatroom.create_private_room(users, chatroom_name)
  #     expect(chatroom.participants.count).to eq(users.count)
  #   end
  # end
end
