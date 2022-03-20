class AddDistrictToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :district, :string
  end
end
