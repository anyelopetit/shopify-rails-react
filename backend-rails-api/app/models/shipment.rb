class Shipment < ApplicationRecord
  belongs_to :order

  enum status: {
    taken: 0,
    in_route: 1,
    late: 2,
    delivered: 3,
    cancelled: 4
  }

  delegate :payment, :products, :origin, :sizes, :kind, :reference, :destiny,
           :items, :courier, :total_price, to: :order
end
