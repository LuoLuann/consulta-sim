require "test_helper"

class PatientTest < ActiveSupport::TestCase
  test "should not save a patient with wrong paramers " do
    valid_patient = Patient.new(fullname: "Luann",
                                birthdate: "Mon, 03 Jul 2023",
                                cpf: "12345678910",
                                email: "l@gmail.com",
                                address_attributes: {
                                  cep: "3600012",
                                  city: "garanhuns",
                                  neighborhood: "centro",
                                  street: "rua 1",
                                  next: "hospital"
                                })

  assert_not valid_patient.save
  end

  test "should save a patient with valid parameters" do
    patient_params = {
      fullname: "Luann Ferreira",
      birthdate: Date.current,
      cpf: "12345678901",
      email: "luann.ferreira@example.com",
      address_attributes: {
        cep: "12345678",
        city: "Garanhuns",
        neighborhood: "Centro",
        street: "Rua 1",
        next: "Hospital"
      }
    }

    patient = Patient.new(patient_params)
    assert patient.save
  end
end
