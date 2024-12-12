class CreateDeliveryDetails < ActiveRecord::Migration[8.0]
  def change
    create_table :delivery_details do |t|
      t.date :date
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
