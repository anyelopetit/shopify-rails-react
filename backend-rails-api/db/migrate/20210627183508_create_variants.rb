class CreateVariants < ActiveRecord::Migration[6.0]
  def change
    create_table :variants do |t|
      t.integer :shopify_id
      t.belongs_to :product, null: false, foreign_key: true
      t.string :title
      t.float :price

      t.timestamps
    end
  end
end
