require 'rails_helper'

RSpec.describe 'V1::LineItems', type: :request do
  describe 'GET /v1/orders/1/line_items' do
    it 'works!' do
      get v1_order_line_items_path(create(:order).to_param)
      expect(response).to have_http_status(200)
    end
  end
end
