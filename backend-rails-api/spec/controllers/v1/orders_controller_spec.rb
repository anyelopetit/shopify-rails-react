# frozen_string_literal: true

require 'rails_helper'

RSpec.describe V1::OrdersController, type: :controller do
  let(:attributes) { JSON.parse(File.read("#{Rails.root}/order.json")).symbolize_keys! }
  let(:order) { create(:order) }
  let(:attribute_keys) { Order.attribute_names.map(&:to_sym) | %i[line_items shipments] }

  describe 'GET #index' do
    before do
      order
      get :index, params: {}
    end

    it '200 - Ok' do
      expect(response.status).to eq(200)
    end

    it 'responses correct attributes' do
      data = order.slice(*attribute_keys).keys.sort
      expected = response.parsed_body.first.keys.sort

      expect(expected).to match_array(data)
    end
  end

  describe 'GET #show' do
    before { get :show, params: { id: order.to_param } }

    it '200 - Ok' do
      expect(response.status).to eq(200)
    end

    it 'responses correct attributes' do
      data = order.slice(*attribute_keys).keys
      expected = response.parsed_body.keys

      expect(expected).to match_array(data)
    end
  end

  describe 'POST #create' do
    let(:order) { create(:order) }

    before do
      order
      post :create, params: attributes
    end

    it '201 - Created' do
      expect(response.status).to eq(201)
    end

    it 'responses correct attributes' do
      data = order.slice(*attribute_keys).keys
      expect(response.parsed_body.keys).to match_array(data)
    end
  end

  describe 'PUT #update' do
    before do
      put :update, params: { id: order.to_param, order: attributes }
    end

    it '200 - Ok' do
      expect(response.status).to eq(200)
    end

    it 'responses an order object' do
      attrs = order.slice(*attribute_keys).keys
      expect(response.parsed_body.keys).to match_array(attrs)
    end
  end

  describe 'DELETE #destroy' do
    before { delete :destroy, params: { id: order.to_param } }

    it '204 - No Content' do
      expect(response.status).to eq(204)
    end

    it 'destroys the order' do
      expect(Order.count).to eq(0)
    end
  end
end
