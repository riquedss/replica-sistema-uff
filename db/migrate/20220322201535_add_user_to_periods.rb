class AddUserToPeriods < ActiveRecord::Migration[7.0]
  def change
    add_reference :periods, :user, foreign_key: true
  end
end
