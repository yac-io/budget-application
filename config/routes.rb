Rails.application.routes.draw do
  resources :transactions
  resources :categories
  resources :payment_means
  resources :accounts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
