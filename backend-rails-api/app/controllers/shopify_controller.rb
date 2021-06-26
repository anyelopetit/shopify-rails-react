# frozen_string_literal: true

# Connect with any Shopify index endpoint
class ShopifyController < ApplicationController
  def index
    endpoint_name = params[:path].split('v1/').last
    url = "#{API_ROOT}/#{endpoint_name}.json"
    @items = get(url)

    render json: @items
  end
end
