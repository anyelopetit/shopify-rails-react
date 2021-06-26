class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :shopify_id
      t.string :payment
      t.string :products
      t.string :origin
      t.string :sizes
      t.string :kind
      t.string :reference
      t.string :destiny
      t.string :items
      t.string :courier
      t.integer :status

      t.timestamps
    end
  end
end
