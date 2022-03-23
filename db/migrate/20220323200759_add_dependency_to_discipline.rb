class AddDependencyToDiscipline < ActiveRecord::Migration[7.0]
  def change
    add_reference :disciplines, :dependency, foreign_key: true
  end
end
