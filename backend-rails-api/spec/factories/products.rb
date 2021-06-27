FactoryBot.define do
  factory :product do
    shopify_id { '' }
    title { 'MyString' }
    vendor { 'MyString' }
    product_type { 'MyString' }
    status { 1 }
  end
end
