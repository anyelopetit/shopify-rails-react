# frozen_string_literal: true

# LineItem Serializer
class LineItemSerializer < ActiveModel::Serializer
  attributes LineItem.column_names

  belongs_to :order
  belongs_to :variant
end
