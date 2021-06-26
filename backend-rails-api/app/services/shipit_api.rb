# frozen_string_literal: true

# Shipit API Requests
class ShipitApi
  include RestClient

  def self.get(url, headers)
    api_request(:get, url, headers)
  end

  def self.post(url, payload, headers)
    api_request(:post, url, headers, payload)
  end

  def self.put(url, payload, headers)
    api_request(:put, url, headers, payload)
  end

  def self.delete(url, headers)
    api_request(:delete, url, headers)
  end

  def self.api_request(http_method, url, headers, payload = nil)
    api_response =
      begin
        if payload
          RestClient.try(http_method, url, payload, headers)
        else
          RestClient.try(http_method, url, headers)
        end
      rescue StandardError => e
        e.response
      end
    Decode.json(api_response)
  end
end
