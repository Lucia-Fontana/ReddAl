class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :state
      t.float :total_price
      t.float :total_co2e
      t.float :total_quantity
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
