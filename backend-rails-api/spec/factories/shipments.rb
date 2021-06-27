# frozen_string_literal: true

FactoryBot.define do
  factory :shipment do
    association :order
  end
end
