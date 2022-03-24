class RemoveUserIdFromPeriods < ActiveRecord::Migration[7.0]
  def change
    remove_column :periods, :user_id, :index
  end
end
