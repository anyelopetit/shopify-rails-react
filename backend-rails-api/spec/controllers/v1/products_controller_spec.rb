# frozen_string_literal: true

require 'rails_helper'

RSpec.describe V1::ProductsController, type: :controller do
  let(:attributes) { Product.last.as_json }
  let(:product) { create(:product) }
  let(:attribute_keys) { Product.attribute_names.map(&:to_sym) }

  describe 'GET #index' do
    before do
      product
      get :index, params: {}
    end

    it '200 - Ok' do
      expect(response.status).to eq(200)
    end

    it 'responses correct attributes' do
      data = product.slice(*attribute_keys).keys.sort
      expected = response.parsed_body.first.keys.sort

      expect(expected).to match_array(data)
    end
  end

  describe 'GET #show' do
    before { get :show, params: { id: product.to_param } }

    it '200 - Ok' do
      expect(response.status).to eq(200)
    end

    it 'responses correct attributes' do
      data = product.slice(*attribute_keys).keys
      expected = response.parsed_body.keys

      expect(expected).to match_array(data)
    end
  end

  describe 'POST #create' do
    let(:product) { create(:product) }

    before do
      product
      post :create, params: attributes
    end

    it '201 - Created' do
      expect(response.status).to eq(201)
    end

    it 'responses correct attributes' do
      data = product.slice(*attribute_keys).keys
      expect(response.parsed_body.keys).to match_array(data)
    end
  end

  describe 'PUT #update' do
    before do
      put :update, params: { id: product.to_param, product: attributes }
    end

    it '200 - Ok' do
      expect(response.status).to eq(200)
    end

    it 'responses an product object' do
      attrs = product.slice(*attribute_keys).keys
      expect(response.parsed_body.keys).to match_array(attrs)
    end
  end

  describe 'DELETE #destroy' do
    before { delete :destroy, params: { id: product.to_param } }

    it '204 - No Content' do
      expect(response.status).to eq(204)
    end

    it 'destroys the product' do
      expect(Product.count).to eq(0)
    end
  end
end
