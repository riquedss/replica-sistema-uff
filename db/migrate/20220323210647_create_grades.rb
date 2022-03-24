class CreateGrades < ActiveRecord::Migration[7.0]
  def change
    create_table :grades do |t|
      t.references :professor, foreign_key: { to_table: 'users' }
      t.references :student, foreign_key: { to_table: 'users' }
      t.float :primeira_nota
      t.float :segunda_nota

      t.timestamps
    end
  end
end
