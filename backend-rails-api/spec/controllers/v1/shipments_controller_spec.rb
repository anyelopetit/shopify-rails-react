# frozen_string_literal: true

require 'rails_helper'

RSpec.describe V1::ShipmentsController, type: :controller do
  let(:attributes) { Shipment.take.as_json }
  let(:shipment) { create(:shipment) }
  let(:attribute_keys) { Shipment.attribute_names.map(&:to_sym) }

  describe 'GET #index' do
    before do
      shipment
      get :index, params: {}
    end

    it '200 - Ok' do
      expect(response.status).to eq(200)
    end

    it 'responses correct attributes' do
      data = shipment.slice(*attribute_keys).keys.sort
      expected = response.parsed_body.first.keys.sort

      expect(expected).to match_array(data)
    end
  end

  describe 'GET #show' do
    before { get :show, params: { id: shipment.to_param } }

    it '200 - Ok' do
      expect(response.status).to eq(200)
    end

    it 'responses correct attributes' do
      data = shipment.slice(*attribute_keys).keys
      expected = response.parsed_body.keys

      expect(expected).to match_array(data)
    end
  end

  describe 'POST #create' do
    let(:shipment) { create(:shipment) }

    before do
      shipment
      post :create, params: attributes
    end

    it '201 - Created' do
      expect(response.status).to eq(201)
    end

    it 'responses correct attributes' do
      data = shipment.slice(*attribute_keys).keys
      expect(response.parsed_body.keys).to match_array(data)
    end
  end

  describe 'PUT #update' do
    before do
      put :update, params: { id: shipment.to_param, shipment: attributes }
    end

    it '200 - Ok' do
      expect(response.status).to eq(200)
    end

    it 'responses an shipment object' do
      attrs = shipment.slice(*attribute_keys).keys
      expect(response.parsed_body.keys).to match_array(attrs)
    end
  end

  describe 'DELETE #destroy' do
    before { delete :destroy, params: { id: shipment.to_param } }

    it '204 - No Content' do
      expect(response.status).to eq(204)
    end

    it 'destroys the shipment' do
      expect(Shipment.count).to eq(0)
    end
  end
end
