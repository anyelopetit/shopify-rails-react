# frozen_string_literal: true

require 'rails_helper'

RSpec.describe V1::LineItemsController, type: :controller do
  let(:attributes) { LineItem.last.as_json }
  let(:order) { create(:order) }
  let(:product) { create(:product) }
  let(:variant) { create(:variant, product: product) }
  let(:line_item) { create(:line_item, variant: variant, order: order) }
  let(:attribute_keys) { LineItem.attribute_names.map(&:to_sym) }

  describe 'GET #index' do
    before do
      order
      line_item
      get :index, params: { order_id: order.to_param }
    end

    it '200 - Ok' do
      expect(response.status).to eq(200)
    end

    it 'responses correct attributes' do
      data = line_item.slice(*attribute_keys).keys.sort
      expected = response.parsed_body.first.keys.sort

      expect(expected).to match_array(data)
    end
  end

  describe 'GET #show' do
    before { get :show, params: { order_id: order.to_param, id: line_item.to_param } }

    it '200 - Ok' do
      expect(response.status).to eq(200)
    end

    it 'responses correct attributes' do
      data = line_item.slice(*attribute_keys).keys
      expected = response.parsed_body.keys

      expect(expected).to match_array(data)
    end
  end

  describe 'POST #create' do
    let(:line_item) { create(:line_item, order: order, variant: variant) }

    before do
      line_item
      post :create, params: attributes.merge(order_id: order.to_param)
    end

    it '201 - Created' do
      expect(response.status).to eq(201)
    end

    it 'responses correct attributes' do
      data = line_item.slice(*attribute_keys).keys
      expect(response.parsed_body.keys).to match_array(data)
    end
  end

  describe 'PUT #update' do
    before do
      put :update, params: { order_id: order.to_param, id: line_item.to_param, line_item: attributes }
    end

    it '200 - Ok' do
      expect(response.status).to eq(200)
    end

    it 'responses an line_item object' do
      attrs = line_item.slice(*attribute_keys).keys
      expect(response.parsed_body.keys).to match_array(attrs)
    end
  end

  describe 'DELETE #destroy' do
    before { delete :destroy, params: { order_id: order.to_param, id: line_item.to_param } }

    it '204 - No Content' do
      expect(response.status).to eq(204)
    end

    it 'destroys the line_item' do
      expect(LineItem.count).to eq(0)
    end
  end
end
