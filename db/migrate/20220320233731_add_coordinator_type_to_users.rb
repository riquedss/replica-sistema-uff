class AddCoordinatorTypeToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :coordinator_type, :integer
  end
end
