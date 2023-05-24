Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :products, only: [ :index, :show, :new, :create ] do
    resources :reviews, only: [:index, :show, :new, :create]
    member do
      post 'toggle_favorite', to: "products#toggle_favorite"
    end
    resources :purchases, only: [ :create ]
  end
  resources :purchases, only: [ :destroy ]
  resources :orders, only: [ :index, :show, :create ] do
    resources :payments, only: :new
  end
  resources :products, only: :destroy
  get "dashboard", to: "pages#dashboard"
  get "favorites", to: "products#favorites"
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
end
