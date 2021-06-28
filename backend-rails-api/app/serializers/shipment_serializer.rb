# frozen_string_literal: true

# Shipment Serializer
class ShipmentSerializer < ActiveModel::Serializer
  attributes Shipment.column_names

  belongs_to :order
end
