class AddUsersToCourse < ActiveRecord::Migration[7.0]
  def change
    add_reference :courses, :users, foreign_key: true
  end
end
