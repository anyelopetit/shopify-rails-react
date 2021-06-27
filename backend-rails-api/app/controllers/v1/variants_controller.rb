# frozen_string_literal: true

module V1
  class VariantsController < ApplicationController
    before_action :set_product
    before_action :set_variant, only: %i[show update destroy]

    # GET /variants
    def index
      @variants = @product.variants

      render json: @variants
    end

    # GET /variants/1
    def show
      render json: @variant
    end

    # POST /variants
    def create
      @variant = @product.variants.new(variant_params)

      if @variant.save
        render json: @variant, status: :created, location: [:v1, @product]
      else
        render json: @variant.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /variants/1
    def update
      if @variant.update(variant_params)
        render json: @variant
      else
        render json: @variant.errors, status: :unprocessable_entity
      end
    end

    # DELETE /variants/1
    def destroy
      @variant.destroy
    end

    private

    def set_product
      @product = Product.find(params[:product_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_variant
      @variant = @product.variants.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def variant_params
      params.permit(Variant.editable_attributes)
    end
  end
end
