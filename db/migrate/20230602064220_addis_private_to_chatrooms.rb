class AddisPrivateToChatrooms < ActiveRecord::Migration[7.0]
  def change
    add_column :chatrooms, :is_private, :boolean, default: false
  end
end
