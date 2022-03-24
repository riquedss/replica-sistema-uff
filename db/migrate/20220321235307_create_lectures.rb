class CreateLectures < ActiveRecord::Migration[7.0]
  def change
    create_table :lectures do |t|
      t.references :user, foreign_key: true
      t.references :discipline, foreign_key: true

      t.timestamps
    end
  end
end
