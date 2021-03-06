require 'rails_helper'

RSpec.describe LineItem, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:order) }
    it { is_expected.to belong_to(:variant) }
  end
end
