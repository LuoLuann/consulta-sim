require "test_helper"

class ConsultationTest < ActiveSupport::TestCase

  test "save consultation" do
    consultation = Consultation.new(patient: patients(:one),
                  doctor: doctors(:one),
                  time: Time.now + 1.hour,
                  date: Date.current
                )

    assert consultation.save
  end

  test "should not save without doctor" do
    consultation = Consultation.new(patient: patients(:one),
                                    time: Time.now + 1.hour,
                                    date: Date.current
                                  )

    assert_not consultation.save
  end
end
