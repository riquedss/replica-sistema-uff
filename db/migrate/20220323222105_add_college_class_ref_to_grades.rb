class AddCollegeClassRefToGrades < ActiveRecord::Migration[7.0]
  def change
    add_reference :grades, :college_class, null: false, foreign_key: true
  end
end
