class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.editable_attributes
    (attribute_names - %w[id created_at updated_at]).map(&:to_sym)
  end
end
