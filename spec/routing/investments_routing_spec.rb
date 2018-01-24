require 'rails_helper'

RSpec.describe InvestmentsController, type: :routing do
  describe 'routing' do
    it 'routes to #new' do
      expect(get: '/accounts/1/investments/new').to route_to('investments#new', account_id: '1')
    end

    it 'routes to #show' do
      expect(get: '/accounts/2/investments/1').to route_to('investments#show', account_id: '2', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/accounts/2/investments/1/edit').to route_to('investments#edit', account_id: '2', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/accounts/2/investments').to route_to('investments#create', account_id: '2')
    end

    it 'routes to #update via PUT' do
      expect(put: '/accounts/2/investments/1').to route_to('investments#update', account_id: '2', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/accounts/2/investments/1').to route_to('investments#update', account_id: '2', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/accounts/2/investments/1').to route_to('investments#destroy', account_id: '2', id: '1')
    end
  end
end
