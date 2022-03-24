class AddDepartmentToDisciplines < ActiveRecord::Migration[7.0]
  def change
    add_reference :disciplines, :department, null: false, foreign_key: true
  end
end
