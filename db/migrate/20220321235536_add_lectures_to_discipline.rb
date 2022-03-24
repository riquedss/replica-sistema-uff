class AddLecturesToDiscipline < ActiveRecord::Migration[7.0]
  def change
    add_reference :disciplines, :lectures, foreign_key: true
  end
end
