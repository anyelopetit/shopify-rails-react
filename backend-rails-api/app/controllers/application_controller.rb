# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ApiRequestable

  def index
    render json: { say_hi: 'Hello' }
  end
end
