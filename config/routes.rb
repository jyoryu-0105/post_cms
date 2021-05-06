Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  namespace :admins do
    root to: 'admins#index'

    resources :orders do
      collection { post :import }
      collection { get :download }
    end

    resources :posts do
      get 'draft', on: :collection
      get 'delivered', on: :collection
      get 'published', on: :collection
      patch 'declined', on: :member
      patch 'publish', on: :member
    end

  end

  namespace :users do
    root to: "users#index"
    resources :applies, only: [:index, :new, :create, :destroy] 
    resources :posts do 
      get 'draft', on: :collection
      get 'delivered', on: :collection
      patch 'deliver', on: :member
    end
  end

  resources :posts , only: [:index, :show, :update]
end