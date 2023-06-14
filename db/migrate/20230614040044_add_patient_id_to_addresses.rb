class AddPatientIdToAddresses < ActiveRecord::Migration[7.0]
  def change
    add_reference :addresses, :patient, foreign_key: true
  end
end
