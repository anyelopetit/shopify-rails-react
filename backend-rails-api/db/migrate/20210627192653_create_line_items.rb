class CreateLineItems < ActiveRecord::Migration[6.0]
  def change
    create_table :line_items do |t|
      t.integer :shopify_id
      t.belongs_to :order, null: false, foreign_key: true
      t.belongs_to :variant, null: false, foreign_key: true
      t.string :title
      t.float :price
      t.integer :quantity
      t.float :weight_quantity
      t.string :weight_unit

      t.timestamps
    end
  end
end
