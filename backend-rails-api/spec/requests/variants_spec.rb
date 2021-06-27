require 'rails_helper'

RSpec.describe 'V1::Variants', type: :request do
  describe 'GET /v1/products/1/variants' do
    it 'works!' do
      get v1_product_variants_path(create(:product).to_param)
      expect(response).to have_http_status(200)
    end
  end
end
