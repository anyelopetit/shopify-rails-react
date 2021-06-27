require 'test_helper'

class ShipmentTest < ActiveSupport::TestCase
  context 'associations' do
    should belong_to(:order).class_name('Order')
  end
end
