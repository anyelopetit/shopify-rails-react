# frozen_string_literal: true

# Shipment Serializer
class ShipmentSerializer < ActiveModel::Serializer
  attributes Shipment.column_names, :total_price

  belongs_to :order
end
