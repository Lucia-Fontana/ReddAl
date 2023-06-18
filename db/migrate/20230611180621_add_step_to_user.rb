class AddStepToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :step, :string
  end
end
