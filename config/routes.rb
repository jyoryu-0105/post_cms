Rails.application.routes.draw do
  root to: 'users#index'

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get 'admin/sign_up', to: 'users/registrations#new', as: :new_admin_registration
    post 'admin/sign_up', to: 'users/registrations#create', as: :admin_registration
    get 'admin/sign_in', to: 'users/sessions#new', as: :new_admin_session
    post 'admin/sign_in', to: 'users/sessions#create', as: :admin_session
    delete 'admin/sign_out', to: 'users/sessions#destroy', as: :destroy_admin_session
  end

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