Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'user_addresses', to: 'users/registrations#new_user_address'
    post 'user_addresses', to: 'users/registrations#create_user_address'
  end
  root to: 'items#index'
  resources :users
  resources :items do
    member do
      get 'confirm'
      post 'pay'
    end
  end
  resources :cards, only: [:new, :create, :show, :destroy] do
  end
end