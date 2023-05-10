class AddQrCodeToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :qr_code, :string
  end
end
