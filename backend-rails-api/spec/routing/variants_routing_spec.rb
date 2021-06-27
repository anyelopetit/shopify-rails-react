require 'rails_helper'

RSpec.describe V1::VariantsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/v1/products/1/variants').to route_to('v1/variants#index', product_id: '1')
    end

    it 'routes to #show' do
      expect(get: '/v1/products/1/variants/1').to route_to('v1/variants#show', id: '1', product_id: '1')
    end


    it 'routes to #create' do
      expect(post: '/v1/products/1/variants').to route_to('v1/variants#create', product_id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: '/v1/products/1/variants/1').to route_to('v1/variants#update', id: '1', product_id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/v1/products/1/variants/1').to route_to('v1/variants#update', id: '1', product_id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/v1/products/1/variants/1').to route_to('v1/variants#destroy', id: '1', product_id: '1')
    end
  end
end
