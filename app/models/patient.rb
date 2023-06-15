class Patient < ApplicationRecord
  has_one :address
  accepts_nested_attributes_for :address

  has_many :consultations

  validates :fullname, presence: true, length: { minimum: 10, maximum: 70}
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
  #validates :birthdate_validation

  # def birthdate_validation
  #   return birthdate.present?

  # if birthdate_validation

end
