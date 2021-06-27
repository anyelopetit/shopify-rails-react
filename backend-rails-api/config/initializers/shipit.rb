SHOPIFY_API_KEY = ENV['SHOPIFY_API_KEY']
SHOPIFY_API_SECRET = ENV['SHOPIFY_API_SECRET']
SHOP_URL = ENV['SHOP_URL']
SHOPIFY_ACCESS_TOKEN = ENV['SHOPIFY_ACCESS_TOKEN']

API_ROOT = "https://#{SHOP_URL}/admin/api/2021-04".freeze
AUTH_HEADERS = {
  'Accept' => 'application/json',
  'Content-Type' => 'application/json',
  'X-Shopify-Access-Token' => SHOPIFY_ACCESS_TOKEN
}.freeze

# Routes

# Orders
ORDERS_URL = "#{API_ROOT}/orders.json".freeze
PRODUCTS_URL = "#{API_ROOT}/products.json".freeze
