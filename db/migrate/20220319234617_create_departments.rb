class CreateDepartments < ActiveRecord::Migration[7.0]
  def change
    create_table :departments do |t|
      t.string :name
      t.string :knowledge_area
      t.string :code
      t.string :campus
      t.references :user

      t.timestamps
    end
  end
end