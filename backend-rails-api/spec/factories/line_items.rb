FactoryBot.define do
  factory :line_item do
    shopify_id { 1 }
    variant { nil }
    title { 'MyString' }
    price { 1.5 }
    quantity { 1 }
    weight_quantity { 1.5 }
    weight_unit { 'MyString' }
    association :order
  end
end
