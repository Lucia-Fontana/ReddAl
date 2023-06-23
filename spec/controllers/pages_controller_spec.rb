require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe '#home' do
    it 'assigns a UUID' do
      get :home
      expect(assigns(:uuid)).to be_present
    end

    it 'renders the home template' do
      get :home
      expect(response).to render_template(:home)
    end
  end
end
