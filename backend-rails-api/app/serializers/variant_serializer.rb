# frozen_string_literal: true

# Variant Serializer
class VariantSerializer < ActiveModel::Serializer
  attributes Variant.column_names

  belongs_to :product
  has_many :line_items
end
