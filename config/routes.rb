Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :users
  resources :items do
    member do
      get 'buy'
    end
  end
end