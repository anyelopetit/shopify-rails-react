class CreateShipments < ActiveRecord::Migration[6.0]
  def change
    create_table :shipments do |t|
      t.belongs_to :order, null: false, foreign_key: true
      t.integer :status
      t.string :street
      t.string :house_number
      t.string :compliment

      t.timestamps
    end
  end
end
