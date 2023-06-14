class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :cep
      t.string :city
      t.string :street
      t.string :next
      t.integer :patient_id
      t.timestamps
    end
  end
end
