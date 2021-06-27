# frozen_string_literal: true

# Custom Shopify controller
class ShopifyController < ApplicationController
  # Connect with any Shopify index endpoint
  def index
    endpoint_name = params[:path].split('v1/').last
    url = "#{API_ROOT}/#{endpoint_name}.json"
    @items = get(url)

    render json: @items
  end
end
