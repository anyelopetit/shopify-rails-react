class Shipment < ApplicationRecord
  belongs_to :order

  enum status: {
    taked: 0,
    in_route: 1,
    late: 2,
    delivered: 3,
    cancelled: 4
  }
end
