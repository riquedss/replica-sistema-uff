class AddAvailabilitiesToCollegeClass < ActiveRecord::Migration[7.0]
  def change
    add_reference :college_classes, :availability, foreign_key: true
  end
end
