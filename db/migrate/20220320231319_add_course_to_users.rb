class AddCourseToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :course
  end
end
