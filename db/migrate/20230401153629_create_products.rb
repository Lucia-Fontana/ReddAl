class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :description
      t.date :deadline
      t.float :co2e
      t.integer :quantity
      t.float :price
      t.references :business, null: false, foreign_key: true

      t.timestamps
    end
  end
end
