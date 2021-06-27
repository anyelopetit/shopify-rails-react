# frozen_string_literal: true

# Product Serializer
class ProductSerializer < ActiveModel::Serializer
  attributes Product.column_names

  has_many :variants
end
