class AddSpotsToCollegeClass < ActiveRecord::Migration[7.0]
  def change
    add_column :college_classes, :spots, :integer
  end
end
