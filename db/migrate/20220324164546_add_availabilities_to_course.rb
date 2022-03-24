class AddAvailabilitiesToCourse < ActiveRecord::Migration[7.0]
  def change
    add_reference :courses, :availability, foreign_key: true
  end
end
