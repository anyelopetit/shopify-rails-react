# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    shopify_id { 123_456 }
    payment { { 'status' => 'paid' } }
    products { { 'sku' => 123_456, 'amount' => 1, 'description' => 'Pack 4 libros Shipit' } }
    origin { { 'email' => 'hirochi@shipit.cl', 'phone' => '+56923000000', 'number' => '4499', 'street' => 'Apoquindo', 'commune_id' => 308, 'complement' => 'Piso 13' } }
    sizes { { 'width' => 10.0, 'height' => 10.0, 'length' => 10.0, 'weight' => 1.0, 'volumetric_weight' => 1.0} }
    kind { 'shopify' }
    reference { '#6939' }
    destiny { { 'email' => 'hirochi@shipit.cl', 'phone' => '+56923000000', 'number' => '123', 'street' => 'Juan Almagro', 'commune_id' => 326, 'complement' => 'depto 14' } }
    items { '1' }
    courier { 'starken' }
    status { 0 }
  end
end
