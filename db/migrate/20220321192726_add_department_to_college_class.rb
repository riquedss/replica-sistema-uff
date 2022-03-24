class AddDepartmentToCollegeClass < ActiveRecord::Migration[7.0]
  def change
    add_reference :college_classes, :department, null: false, foreign_key: true
  end
end
