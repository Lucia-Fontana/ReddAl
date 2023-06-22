require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let(:signed_in_user) { FactoryBot.create(:user) }

  it { should route(:get, '/products').to(action: :index) }
  it { should route(:get, '/products/1').to(action: :show, id: 1) }
  it { should route(:post, '/products').to(action: :create) }

  # creates a "stub" current_user
  before do
    allow_any_instance_of(ProductsController).to receive(:current_user).and_return(signed_in_user)
  end

  # describe 'GET #index' do
  #   it "renders the :index view" do
  #     get :index
  #     expect(response).to render_template(:index)
  #   end
  # end

end
