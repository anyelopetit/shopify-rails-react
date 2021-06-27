# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'hash_dot'

api_orders = ShipitApi.get(ORDERS_URL, AUTH_HEADERS)['orders']
fake_order = JSON.parse(File.read("#{Rails.root}/order.json")).to_dot

puts "Shopify Store API has #{api_orders&.size.to_i} orders"

if api_orders.blank?
  puts 'Creating fake Order...'
  order = Order.new(fake_order)
  if order.save
    puts "Order ID #{order.id} was saved!"
  elsif order.errors.full_messages
    puts "Cannot save order: #{order.errors.full_messages}"
  else
    puts 'Something happend :('
  end
  return
end

api_orders.each do |api_order|
  puts "API Order data: #{api_order}"

  api_order = api_order.to_dot

  order = Order.new
  order.shopify_id = api_order.id
  order.payment = api_order.payment_gateway_names.present? ? api_order.payment_gateway_names : fake_order.payment
  order.products = api_order.line_items.present? ? api_order.line_items : fake_order.products
  order.origin = fake_order.origin
  order.sizes = fake_order.sizes
  order.kind = fake_order.kind
  order.reference = fake_order.reference
  order.destiny = fake_order.destiny
  order.items = api_order.line_items.present? ? api_order.line_items.size : fake_order.items
  order.courier = fake_order.courier

  if order.save
    puts "Order ID #{order.id} was saved!"
  elsif order.errors.full_messages
    puts "Cannot save order: #{order.errors.full_messages}"
  else
    puts 'Something happend :('
  end
end
