require 'rails_helper'

RSpec.describe RecurringTransactionsController, type: :routing do
  describe 'routing' do

    it 'routes to #index' do
      expect(:get => '/accounts/1/recurring-transactions').to route_to('recurring_transactions#index', :account_id => '1')
    end

    it 'routes to #new' do
      expect(:get => '/accounts/1/recurring-transactions/new').to route_to('recurring_transactions#new', :account_id => '1')
    end

    it 'routes to #show' do
      expect(:get => '/accounts/1/recurring-transactions/1').to route_to('recurring_transactions#show', :id => '1', :account_id => '1')
    end

    it 'routes to #edit' do
      expect(:get => '/accounts/1/recurring-transactions/1/edit').to route_to('recurring_transactions#edit', :id => '1', :account_id => '1')
    end

    it 'routes to #create' do
      expect(:post => '/accounts/1/recurring-transactions').to route_to('recurring_transactions#create', :account_id => '1')
    end

    it 'routes to #update via PUT' do
      expect(:put => '/accounts/1/recurring-transactions/1').to route_to('recurring_transactions#update', :id => '1', :account_id => '1')
    end

    it 'routes to #update via PATCH' do
      expect(:patch => '/accounts/1/recurring-transactions/1').to route_to('recurring_transactions#update', :id => '1', :account_id => '1')
    end

    it 'routes to #destroy' do
      expect(:delete => '/accounts/1/recurring-transactions/1').to route_to('recurring_transactions#destroy', :id => '1', :account_id => '1')
    end

  end
end
