class AddAddressNumberToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :address_number, :integer
  end
end
