class CreateAvailabilities < ActiveRecord::Migration[7.0]
  def change
    create_table :availabilities do |t|
      t.references :course, null: false, foreign_key: true
      t.references :college_class, null: false, foreign_key: true

      t.timestamps
    end
  end
end
