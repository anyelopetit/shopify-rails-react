# frozen_string_literal: true

module V1
  # Orders Controller
  class OrdersController < ApplicationController
    before_action :set_order, only: %i[show update destroy]

    # GET   /api/v1/orders
    def index
      @orders = Order.all

      render json: @orders
    end

    # GET api/v1/orders/1
    def show
      render json: @order
    end

    # POST api/v1/orders
    def create
      order = Order.new(order_params)

      if order.save
        render json: order, status: :created
      else
        render json: order.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT api/v1/orders/1
    def update
      if @order.update(order_params)
        render json: @order
      else
        render json: @order.errors, status: :unprocessable_entity
      end
    end

    # DELETE api/v1/orders/1
    def destroy
      @order.destroy

      head :no_content
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_params
      params.require(:order).permit(
        :shopify_id, :payment, :products, :origin, :sizes, :kind, :reference,
        :destiny, :items, :courier, :status
      )
    end
  end
end