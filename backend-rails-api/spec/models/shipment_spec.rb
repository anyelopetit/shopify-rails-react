# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Shipment, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:order) }
  end

  describe 'validations' do
    it { should define_enum_for(:status).with_values(%i[taken in_route late delivered cancelled]) }
  end
end
