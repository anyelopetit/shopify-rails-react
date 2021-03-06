require 'test_helper'

class ShipmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shipment = shipments(:one)
  end

  test 'should get index' do
    get shipments_url, as: :json
    assert_response :success
  end

  test 'should create shipment' do
    assert_difference('Shipment.count') do
      post shipments_url, params: { shipment: @shipment.as_json }, as: :json
    end

    assert_response 201
  end

  test 'should show shipment' do
    get shipment_url(@shipment), as: :json
    assert_response :success
  end

  test 'should update shipment' do
    patch shipment_url(@shipment), params: { shipment: @shipment.as_json }, as: :json
    assert_response 200
  end

  test 'should destroy shipment' do
    assert_difference('Shipment.count', -1) do
      delete shipment_url(@shipment), as: :json
    end

    assert_response 204
  end
end
