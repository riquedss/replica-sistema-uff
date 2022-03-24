class AddClassEnrollmentsToCollegeClass < ActiveRecord::Migration[7.0]
  def change
    add_reference :college_classes, :class_enrollment, foreign_key: true
  end
end
