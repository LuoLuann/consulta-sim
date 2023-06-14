class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :fullname
      t.string :cpf
      t.string :email
      t.string :specialty
      t.integer :crm

      t.timestamps
    end
  end
end
