class CreateDependencies < ActiveRecord::Migration[7.0]
  def change
    create_table :dependencies do |t|
      t.integer :requirement_id, foreign_key: true
      t.integer :target_id, foreign_key: true
      t.timestamps
    end
  end
end
