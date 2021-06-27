# frozen_string_literal: true

require 'rails_helper'

RSpec.describe V1::VariantsController, type: :controller do
  let(:attributes) { Variant.last.as_json }
  let(:product) { create(:product) }
  let(:variant) { create(:variant, product: product) }
  let(:attribute_keys) { Variant.attribute_names.map(&:to_sym) }

  describe 'GET #index' do
    before do
      variant
      get :index, params: { product_id: product.to_param }
    end

    it '200 - Ok' do
      expect(response.status).to eq(200)
    end

    it 'responses correct attributes' do
      data = variant.slice(*attribute_keys).keys.sort
      expected = response.parsed_body.first.keys.sort

      expect(expected).to match_array(data)
    end
  end

  describe 'GET #show' do
    before { get :show, params: { product_id: product.to_param, id: variant.to_param } }

    it '200 - Ok' do
      expect(response.status).to eq(200)
    end

    it 'responses correct attributes' do
      data = variant.slice(*attribute_keys).keys
      expected = response.parsed_body.keys

      expect(expected).to match_array(data)
    end
  end

  describe 'POST #create' do
    let(:variant) { create(:variant) }

    before do
      variant
      post :create, params: attributes.merge(product_id: product.to_param)
    end

    it '201 - Created' do
      expect(response.status).to eq(201)
    end

    it 'responses correct attributes' do
      data = variant.slice(*attribute_keys).keys
      expect(response.parsed_body.keys).to match_array(data)
    end
  end

  describe 'PUT #update' do
    before do
      put :update, params: { product_id: product.to_param, id: variant.to_param, variant: attributes }
    end

    it '200 - Ok' do
      expect(response.status).to eq(200)
    end

    it 'responses an variant object' do
      attrs = variant.slice(*attribute_keys).keys
      expect(response.parsed_body.keys).to match_array(attrs)
    end
  end

  describe 'DELETE #destroy' do
    before { delete :destroy, params: { product_id: product.to_param, id: variant.to_param } }

    it '204 - No Content' do
      expect(response.status).to eq(204)
    end

    it 'destroys the variant' do
      expect(Variant.count).to eq(0)
    end
  end
end
