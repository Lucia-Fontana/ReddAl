require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  # let(:user1) { FactoryBot.create(:user) }
  # let(:user2) { FactoryBot.create(:user) }
  # let(:current_user) { FactoryBot.create(:user) }

  let(:user1) { FactoryBot.create :user }

  # describe '#show' do
  #   it 'should return the user with given id' do
  #     get :show, params: { id: user1.id }
  #     expect(assigns(:user)).to eq(user1)
  #   end
  # end

    # let(:chatroom) { instance_double(Chatroom) }
    # let(:messages) { double('messages') }

    # before do
    #   allow(User).to receive(:find).with(user1.id.to_s).and_return(user1)
    #   allow(User).to receive(:all_except).with(current_user).and_return([user1, user2])
    #   allow(Chatroom).to receive(:new).and_return(chatroom)
    #   allow(controller).to receive(:current_user).and_return(current_user)
    #   allow(controller).to receive(:get_name).and_return('private_1_2')
    #   allow(Chatroom).to receive(:where).with(name: 'private_1_2').and_return(double('chatroom'))
    #   allow(Chatroom).to receive(:create_private_room).and_return(double('chatroom'))
    #   allow(chatroom).to receive(:messages).and_return(messages)
    #   allow(messages).to receive(:order).with(created_at: :asc).and_return(messages)

    #   get :show, params: { id: user1.id }
    # end



    # it 'assigns the requested user to @user' do
    #   expect(assigns(:user)).to eq(user)
    # end

    # it 'assigns all users except current user to @users' do
    #   expect(assigns(:users)).to eq([user1, user2])
    # end

    # it 'assigns a new chatroom to @chatroom' do
    #   expect(assigns(:chatroom)).to eq(chatroom)
    # end

    # it 'assigns the chatroom name to @chatroom_name' do
    #   expect(assigns(:chatroom_name)).to eq('private_1_2')
    # end

    # it 'assigns the single room to @single_room' do
    #   expect(assigns(:single_room)).to eq(double('chatroom'))
    # end

    # it 'assigns a new message to @message' do
    #   expect(assigns(:message)).to be_a_new(Message)
    # end

    # it 'assigns messages to @messages' do
    #   expect(assigns(:messages)).to eq(messages)
    # end

    # it 'renders the :show template' do
    #   expect(response).to render_template(:show)
    # end
end
