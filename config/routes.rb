Rails.application.routes.draw do
  devise_for :users
  get 'home/index'

  resources :transactions
  resources :categories
  resources :payment_means
  resources :accounts

  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
