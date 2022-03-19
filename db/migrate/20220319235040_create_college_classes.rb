class CreateCollegeClasses < ActiveRecord::Migration[7.0]
  def change
    create_table :college_classes do |t|
      t.string :name
      t.string :code
      t.string :calendar
      t.string :room

      t.timestamps
    end
  end
end
