require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  controller do
    def index
      render plain: 'Hello, world!'
    end
  end

  describe 'before_action filters' do
    context 'when not a Devise controller' do
      it 'calls authenticate_user! before action' do
        expect(controller).to receive(:authenticate_user!)
        get :index
      end

      it 'does not call configure_permitted_parameters before action' do
        expect(controller).not_to receive(:configure_permitted_parameters)
        get :index
      end
    end

    context 'when a Devise controller' do
      before { allow(controller).to receive(:devise_controller?).and_return(true) }

      it 'calls configure_permitted_parameters before action' do
        expect(controller).to receive(:configure_permitted_parameters)
        get :index
      end
    end
  end

  describe 'configure_permitted_parameters' do
    it 'configures permitted parameters for sign up' do
      sanitizer = double('sanitizer').as_null_object
      allow(controller).to receive(:devise_parameter_sanitizer).and_return(sanitizer)

      expect(sanitizer).to receive(:permit).with(:sign_up, keys: [:username, :category, :nucleo, :Isee])

      controller.send(:configure_permitted_parameters)
    end

    it 'configures permitted parameters for account update' do
      sanitizer = double('sanitizer').as_null_object
      allow(controller).to receive(:devise_parameter_sanitizer).and_return(sanitizer)

      expect(sanitizer).to receive(:permit).with(:account_update, keys: [:username, :category, :nucleo, :Isee])

      controller.send(:configure_permitted_parameters)
    end
  end

  describe 'default_url_options' do
    it 'returns the default URL options with host from ENV or localhost' do
      allow(ENV).to receive(:[]).with('DOMAIN').and_return('example.com')
      expect(controller.default_url_options).to eq({ host: 'example.com' })

      allow(ENV).to receive(:[]).with('DOMAIN').and_return(nil)
      expect(controller.default_url_options).to eq({ host: 'localhost:3000' })
    end
  end
end
