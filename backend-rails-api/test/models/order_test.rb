require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  context 'associations' do
    should have_many(:shipments).class_name('Shipment')
  end
end
