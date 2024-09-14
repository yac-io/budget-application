Rails.application.routes.draw do

  devise_for :users
  get 'home/index'

  resources :categories
  resources :payment_means, :path => '/payment-means'
  resources :accounts do
    member do
      get 'monthly-view', to: 'accounts#monthly_view'
      get 'report', to: 'accounts#report'
      get 'export', to: 'accounts#export'
    end
    resources :transactions, except: [:index] do
      member do
        put 'state'
      end
    end
    resources :investments, except: [:index]
    resources :recurring_transactions, :path => '/recurring-transactions' do
      member do
        put 'disable'
        put 'enable'
      end
    end
  end

  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
