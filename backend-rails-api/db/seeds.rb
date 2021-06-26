# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

api_orders = ShipitApi.get(ORDERS_URL, AUTH_HEADERS)[:orders]

Rails.logger.info "Shipit Store has #{api_orders.size} orders"

api_orders.each do |api_order|
  Rails.logger.info "API Order data: #{api_order}"
end
