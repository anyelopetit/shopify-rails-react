# frozen_string_literal: true

# Store products
class Product < ApplicationRecord
  has_many :variants
end
