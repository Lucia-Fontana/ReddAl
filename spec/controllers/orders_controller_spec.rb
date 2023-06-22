require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  it { should route(:get, '/orders').to(action: :index) }
  it { should route(:get, '/orders/1').to(action: :show, id: 1) }
  it { should route(:post, '/orders').to(action: :create) }
end
