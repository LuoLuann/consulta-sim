require "test_helper"

class DoctorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save doctor with invalid crm" do
    doctor = Doctor.new fullname: "Luann Ferreira",
                        cpf: "123456789101",
                        email: "luann@gmail.com",
                        specialty: "Médico geral",
                        crm: "abc"

    assert_not doctor.save
  end

  test "should not save doctor without specialty" do
    doctor = Doctor.new fullname: "Luann Ferreira",
                        cpf: "123456789101",
                        email: "luann@gmail.com",
                        specialty: "",
                        crm: "abc"

    assert_not doctor.save
  end
end
