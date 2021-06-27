require 'rails_helper'

RSpec.describe Variant, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:product) }
    it { is_expected.to have_many(:line_items) }
  end
end
