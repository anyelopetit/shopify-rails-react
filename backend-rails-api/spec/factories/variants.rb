FactoryBot.define do
  factory :variant do
    shopify_id { 1 }
    title { 'MyString' }
    price { 1.5 }
    association :product
  end
end
