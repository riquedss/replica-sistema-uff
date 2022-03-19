class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :nacionality
      t.string :state
      t.string :rg
      t.string :cpf
      t.string :email
      t.string :password_digest
      t.date :birth_date

      t.timestamps
    end
  end
end
