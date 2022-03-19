class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :knowledge_area
      t.string :code
      t.string :campus

      t.timestamps
    end
  end
end
