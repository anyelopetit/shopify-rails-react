require 'rails_helper'

RSpec.describe V1::LineItemsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/v1/orders/1/line_items').to route_to('v1/line_items#index', order_id: '1')
    end

    it 'routes to #show' do
      expect(get: '/v1/orders/1/line_items/1').to route_to('v1/line_items#show', id: '1', order_id: '1')
    end

    it 'routes to #create' do
      expect(post: '/v1/orders/1/line_items').to route_to('v1/line_items#create', order_id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: '/v1/orders/1/line_items/1').to route_to('v1/line_items#update', id: '1', order_id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/v1/orders/1/line_items/1').to route_to('v1/line_items#update', id: '1', order_id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/v1/orders/1/line_items/1').to route_to('v1/line_items#destroy', id: '1', order_id: '1')
    end
  end
end
