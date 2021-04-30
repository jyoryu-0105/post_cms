Rails.application.routes.draw do
  namespace :admins do
    root to: 'admins#index'
  end

  namespace :users do
    root to: "users#index"
  end
  
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }

  resources :orders do
    collection { post :import }
    collection { get :download }
  end

  resources :applies, only: [:index, :new, :create, :destroy] 
  resources :posts do
    get 'draft', on: :collection
    get 'delivered', on: :collection
    get 'published', on: :collection
    patch 'deliver', on: :member
    patch 'declined', on: :member
    patch 'publish', on: :member
  end
end