class AddClassEnrollmentsToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :class_enrollment, foreign_key: true
  end
end
