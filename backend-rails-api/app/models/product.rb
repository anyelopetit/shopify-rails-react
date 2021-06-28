# frozen_string_literal: true

# Store products
class Product < ApplicationRecord
  has_many :variants

  enum status: {
    active: 0,
    inactive: 1
  }
end
