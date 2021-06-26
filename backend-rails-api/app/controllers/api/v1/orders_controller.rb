# frozen_string_literal: true

module Api
  module V1
    # Orders Controller
    class OrdersController < ApplicationController
      # GET   /api/v1/orders
      def index
        @orders = get(ORDERS_URL)

        render json: @orders
      end
    end
  end
end
