require 'rails_helper'

RSpec.describe OrdersController, type: :controller do

  it { should route(:get, '/orders').to(action: :index) }
  it { should route(:get, '/orders/1').to(action: :show, id: 1) }
  it { should route(:post, '/orders').to(action: :create) }

  describe 'GET #index' do
    it 'assigns the current user' do
      user = create(:user)
      sign_in(user)
      get :index
      expect(assigns(:user)).to eq(user)
    end

    it 'assigns the orders for the current user' do
      user = create(:user)
      order1 = create(:order, user: user)
      order2 = create(:order, user: user)
      sign_in(user)
      get :index
      expect(assigns(:orders)).to eq([order1, order2])
    end

    it 'renders the index template' do
      user = create(:user)
      sign_in(user)
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'assigns the current user' do
      user = create(:user)
      sign_in(user)
      order = create(:order, user: user)
      get :show, params: { id: order.id }
      expect(assigns(:user)).to eq(user)
    end

    it 'assigns the order for the current user' do
      user = create(:user)
      order = create(:order, user: user)
      sign_in(user)
      get :show, params: { id: order.id }
      expect(assigns(:order)).to eq(order)
    end

    it 'assigns the current user and renders the show template' do
      user = create(:user)
      sign_in(user)
      order = create(:order, user: user)
      get :show, params: { id: order.id }
      expect(assigns(:user)).to eq(user)
      expect(assigns(:order)).to eq(order)
      expect(response).to render_template(:show)
    end
  end

end
