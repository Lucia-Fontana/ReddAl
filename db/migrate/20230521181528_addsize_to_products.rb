class AddsizeToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :size, :integer
  end
end
