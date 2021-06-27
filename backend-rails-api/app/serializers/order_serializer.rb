# frozen_string_literal: true

# Order Serializer
class OrderSerializer < ActiveModel::Serializer
  attributes Order.column_names

  has_many :line_items
end
