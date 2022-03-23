class AddDepartmentToCollegeClasses < ActiveRecord::Migration[7.0]
  def change
    add_reference :college_classes, :department, foreign_key: true
  end
end
