class RemoveCoordinatorTypeFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :coordinator_type, :integer
  end
end
