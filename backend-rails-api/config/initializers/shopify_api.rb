SHOPIFY_API_KEY = ENV['SHOPIFY_API_KEY']
SHOPIFY_API_SECRET = ENV['SHOPIFY_API_SECRET']
SHOP_URL = ENV['SHOP_URL']
SHOPIFY_ACCESS_TOKEN = ENV['SHOPIFY_ACCESS_TOKEN']

ShopifyAPI::Session.setup(api_key: SHOPIFY_API_KEY, secret: SHOPIFY_API_SECRET)
