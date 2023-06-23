require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let(:signed_in_user) { FactoryBot.create(:user) }

  it { should route(:get, '/products').to(action: :index) }
  it { should route(:get, '/products/1').to(action: :show, id: 1) }
  it { should route(:post, '/products').to(action: :create) }

  describe '#index' do
    let(:user) { create(:user) }
    let(:business) { create(:business) }
    let(:product) { create(:product) }

    context 'when user is logged in as retailer' do
      before do
        user.update(category: 'Attività')
        business.products << product
        user.business = business
        sign_in(user)
        get :index
      end

      it 'assigns only the items still available from the retailer' do
        expect(assigns(:products)).to eq([product])
      end

      it 'renders the index template' do
        expect(response).to render_template(:index)
      end
    end
  end

  context 'when user is logged in as customer' do
    let(:user) { create(:user, nucleo: 3) }
    let(:product) { create(:product, size: 3) } #

      before do
        user.update(category: 'Utente')
        user.update(nucleo: 3)
        sign_in(user)
      end


    context 'when search query is present' do
      before do
        get :index, params: { query: 'example query' }
      end

      # it 'assigns only the purchasable items matching the query and user nucleo size' do
      #   expect(assigns(:products)).to eq([product])
      # end

      it 'renders the index template' do
        expect(response).to render_template(:index)
      end
    end

    context 'when search query is not present' do
      before do
        get :index
      end

      it 'assigns only the items with user nucleo size' do
        expect(assigns(:products)).to eq([product])
      end

      it 'renders the index template' do
        expect(response).to render_template(:index)
      end
    end
  end
  #   context "when user is logged in as customer (Utente)" do
  #     let(:user) { create(:user, category: "Utente") }
  #     let(:product) { create(:product, availability: true, size: user.nucleo) }

  #     before do
  #       allow(controller).to receive(:current_user).and_return(user)
  #     end

  #     it "lists only the items that can be purchased by the user" do
  #       get :index
  #       expect(assigns(:products)).to include(product)
  #     end

  #     it "filters products by query if present" do
  #       params = { query: "search query" }
  #       get :index, params: params
  #       expect(assigns(:products)).to include(product)
  #     end
  #   end
  # end
end
