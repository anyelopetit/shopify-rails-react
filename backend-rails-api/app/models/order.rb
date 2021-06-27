# frozen_string_literal: true

# Sale order
class Order < ApplicationRecord
  has_many :shipments
  has_many :line_items

  enum status: {
    pending: 0,
    paid: 1,
    in_route: 2,
    delivered: 3
  }
end
