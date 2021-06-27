require 'rails_helper'

RSpec.describe 'V1::Products', type: :request do
  describe 'GET /v1/products' do
    it 'works!' do
      get v1_products_path
      expect(response).to have_http_status(200)
    end
  end
end
