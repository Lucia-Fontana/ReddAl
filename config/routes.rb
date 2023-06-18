Rails.application.routes.draw do
  # Routes for home page: 'Utente' e 'Attività'
  root to: "pages#home"
  get "dashboard", to: "pages#dashboard"

  # Routes per la gem devise
  devise_for :users
  get 'user/:id', to: 'users#show', as: 'user'
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # get "favorites", to: "products#favorites"

  # Routes that allow multiple reviews to be assigned to
  # a specific product and a purchase to be created for
  # each specific product added to the basket
  resources :products do
    resources :reviews
    # member do
    #   post 'toggle_favorite', to: "products#toggle_favorite"
    # end
    resources :purchases, only: [ :create ]
  end

  resources :purchases, only: [ :destroy ]

  # Routes that allow a payment to be correlated to
  # each order
  resources :orders, only: [ :index, :show, :create ] do
    resources :payments, only: :new
  end

  # Routes that manage chatrooms and messages
  resources :chatrooms, only: [:index, :show] do
    resources :messages, only: :create
  end
end
