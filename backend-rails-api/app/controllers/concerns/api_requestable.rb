# frozen_string_literal: true

# Concern to manage API requests
module ApiRequestable
  extend ActiveSupport::Concern

  private

  def get(url)
    ShipitApi.get(url, AUTH_HEADERS)
  end

  def post(url, payload)
    ShipitApi.post(url, payload, AUTH_HEADERS)
  end

  def put(url, payload)
    ShipitApi.put(url, payload, AUTH_HEADERS)
  end

  def delete(url)
    ShipitApi.delete(url, AUTH_HEADERS)
  end
end
