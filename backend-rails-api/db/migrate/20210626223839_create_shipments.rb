class CreateShipments < ActiveRecord::Migration[6.0]
  def change
    create_table :shipments do |t|
      t.belongs_to :order, null: false, foreign_key: true
      t.integer :status, default: 0
      t.jsonb :payment
      t.jsonb :products
      t.jsonb :origin
      t.jsonb :sizes
      t.string :kind
      t.string :reference
      t.jsonb :destiny
      t.string :items
      t.string :courier

      t.timestamps
    end
  end
end
