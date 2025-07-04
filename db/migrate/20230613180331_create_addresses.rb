class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :cep
      t.string :city
      t.string :street
      t.string :next
      t.string :neighborhood
      t.references :patient, foreign_key: true
      t.timestamps
    end
  end
end
