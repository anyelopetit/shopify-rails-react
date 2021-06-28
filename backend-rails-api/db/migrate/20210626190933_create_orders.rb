class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :shopify_id
      t.jsonb :payment
      t.jsonb :products
      t.jsonb :origin
      t.jsonb :sizes
      t.string :kind
      t.string :reference
      t.jsonb :destiny
      t.string :items
      t.string :courier
      t.integer :status, default: 0
      t.float :total_price

      t.timestamps
    end
  end
end
