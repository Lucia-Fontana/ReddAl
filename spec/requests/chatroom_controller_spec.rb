require 'rails_helper'

RSpec.describe ChatroomsController, type: :controller do
  it { should route(:get, '/chatrooms').to(action: :index) }
  it { should route(:get, '/chatrooms/1').to(action: :show, id: 1) }
end
