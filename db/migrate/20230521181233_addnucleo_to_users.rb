class AddnucleoToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :nucleo, :integer
  end
end
