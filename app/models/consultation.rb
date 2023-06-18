class Consultation < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor

  validates_date :date, presence: { message: " é obrigatório"}
  validates :time, presence: { message: " é obrigatório"}
  validates :patient_id, presence: { message: " é obrigatório"}
  validates :doctor_id, presence: { message: " é obrigatório"}

  validate :date_within_range

  def date_within_range
    if date.present? && (date < Date.current || date > Date.current + 4.months)
      errors.add(:date, ": Consulta deve estar dentro do limite de 4 meses após a data atual")
    end
  end
end
