# frozen_string_literal: true

module V1
  # Shipments Controller
  class ShipmentsController < ApplicationController
    before_action :set_order
    before_action :set_shipment, only: %i[show update destroy]

    # GET /shipments
    def index
      @shipments = @order.shipments

      render json: @shipments
    end

    # GET /shipments/1
    def show
      render json: @shipment
    end

    # POST /shipments
    def create
      @shipment = @order.shipments.new(shipment_params)

      if @shipment.save
        render json: @shipment, status: :created, location: [:v1, @order]
      else
        render json: @shipment.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /shipments/1
    def update
      if @shipment.update(shipment_params)
        render json: @shipment
      else
        render json: @shipment.errors, status: :unprocessable_entity
      end
    end

    # DELETE /shipments/1
    def destroy
      @shipment.destroy

      head :no_content
    end

    private

    def set_order
      @order = Order.find(params[:order_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_shipment
      @shipment = @order.shipments.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def shipment_params
      params.permit(Shipment.editable_attributes)
    end
  end
end
