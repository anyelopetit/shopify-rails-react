# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'hash_dot'

api_orders = ShipitApi.get(ORDERS_URL, AUTH_HEADERS)['orders']
api_products = ShipitApi.get(PRODUCTS_URL, AUTH_HEADERS)['products']
fake_order = JSON.parse(File.read("#{Rails.root}/order.json")).to_dot

puts "Shopify Store API has #{api_products&.size.to_i} products"

api_products.each do |api_product|
  api_product = api_product.to_dot
  api_product_attributes =
    api_product.as_json(only: Product.editable_attributes.map(&:to_s))

  product = Product.new(api_product_attributes)
  product.shopify_id = api_product.id

  if product.save
    puts "Product ID #{product.id} was saved!"

    api_product.variants.each do |api_variant|
      api_variant = api_variant.to_dot

      api_variant_attributes =
        api_variant.as_json(only: Variant.editable_attributes.map(&:to_s))

      variant = Variant.new(api_variant_attributes)
      variant.shopify_id = api_variant.id
      variant.product_id = product.id
      if variant.save!
        puts "Variant ID #{variant.id} was saved!"
      elsif variant.errors.full_messages
        puts "Cannot save variant: #{variant.errors.full_messages}"
      else
        puts 'Something happened with this variant :('
      end
    end
  elsif product.errors.full_messages
    puts "Cannot save product: #{product.errors.full_messages}"
  else
    puts 'Something happened with this product:('
  end
end

puts "Shopify Store API has #{api_orders&.size.to_i} orders"

if api_orders.blank?
  puts 'Creating fake Order...'
  order = Order.new(fake_order)
  if order.save
    puts "Order ID #{order.id} was saved!"
  elsif order.errors.full_messages
    puts "Cannot save order: #{order.errors.full_messages}"
  else
    puts 'Something happened with this order :('
  end
  return
end

api_orders.each do |api_order|
  api_order = api_order.to_dot

  api_order_attributes =
    api_order.as_json(only: Order.editable_attributes.map(&:to_s))

  order = Order.new(api_order_attributes)
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

    api_order.line_items.each do |api_line_item|
      api_line_item = api_line_item.to_dot

      api_line_item_attributes =
        api_line_item.as_json(only: LineItem.editable_attributes.map(&:to_s))

      line_item = LineItem.new(api_line_item_attributes)
      line_item.shopify_id = api_line_item.id
      line_item.order_id = order.id
      line_item.variant_id = Variant.find_by(shopify_id: api_line_item.variant_id).id
      if line_item.save!
        puts "LineItem ID #{line_item.id} was saved!"
      elsif line_item.errors.full_messages
        puts "Cannot save line_item: #{line_item.errors.full_messages}"
      else
        puts 'Something happened with this line_item :('
      end
    end
  elsif order.errors.full_messages
    puts "Cannot save order: #{order.errors.full_messages}"
  else
    puts 'Something happend with this order :('
  end
end
