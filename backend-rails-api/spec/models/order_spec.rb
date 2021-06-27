# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:shipments) }
  end

  describe 'validations' do
    it { should define_enum_for(:status).with_values(%i[pending paid in_route delivered]) }
  end
end
