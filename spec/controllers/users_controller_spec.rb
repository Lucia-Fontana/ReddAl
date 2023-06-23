require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  # describe '#show' do
  #   let(:user) { create(:user) }
  #   let(:current_user) { create(:user) }
  #   let(:chatroom) { create(:chatroom, user_id: user.id) }
  #   let(:message) { create(:message, chatroom: chatroom) }

  #   before do
  #     allow(User).to receive(:find).and_return(user)
  #     allow(User).to receive(:all_except).and_return([current_user])
  #     allow(Chatroom).to receive(:new).and_return(chatroom)
  #     allow(controller).to receive(:current_user).and_return(current_user)
  #     allow(controller).to receive(:get_name).and_return('private_1_2')
  #     allow(Chatroom).to receive(:where).and_return(Chatroom)
  #     allow(Chatroom).to receive(:first).and_return(nil)
  #     allow(Chatroom).to receive(:create_private_room).and_return(chatroom)
  #     allow(chatroom).to receive(:messages).and_return(message)
  #     allow(message).to receive(:order).and_return(message)
  #   end

  #   it 'finds the user by id' do
  #     expect(User).to receive(:find).with(params[:id])
  #     get :show, params: { id: user.id }
  #     expect(assigns(:user)).to eq(user)
  #   end

  #   it 'gets all users except the current user' do
  #     expect(User).to receive(:all_except).with(current_user)
  #     get :show, params: { id: user.id }
  #     expect(assigns(:users)).to eq([current_user])
  #   end

  #   it 'creates a new chatroom' do
  #     expect(Chatroom).to receive(:new)
  #     get :show, params: { id: user.id }
  #     expect(assigns(:chatroom)).to eq(chatroom)
  #   end

  #   it 'gets the chatroom name' do
  #     expect(controller).to receive(:get_name).with(user, current_user)
  #     get :show, params: { id: user.id }
  #     expect(assigns(:chatroom_name)).to eq('private_1_2')
  #   end

  #   it 'checks if the single room exists' do
  #     expect(Chatroom).to receive(:where).with(name: 'private_1_2')
  #     get :show, params: { id: user.id }
  #     expect(assigns(:single_room)).to eq(chatroom)
  #   end

  #   it 'creates a private room if the single room does not exist' do
  #     expect(Chatroom).to receive(:create_private_room).with([user, current_user], 'private_1_2')
  #     get :show, params: { id: user.id }
  #     expect(assigns(:single_room)).to eq(chatroom)
  #   end

  #   it 'creates a new message' do
  #     expect(Message).to receive(:new)
  #     get :show, params: { id: user.id }
  #     expect(assigns(:message)).to eq(message)
  #   end

  #   it 'gets the messages for the single room' do
  #     expect(message).to receive(:order).with(created_at: :asc)
  #     get :show, params: { id: user.id }
  #     expect(assigns(:messages)).to eq(message)
  #   end

  #   it 'renders the show template' do
  #     get :show, params: { id: user.id }
  #     expect(response).to render_template(:show)
  #   end
  # end
end
