class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :shopify_id, index: true
      t.string :title
      t.string :vendor
      t.string :product_type
      t.integer :status

      t.timestamps
    end
  end
end
