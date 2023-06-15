class Doctor < ApplicationRecord
  has_many :consultations

  validates :fullname, presence: true, length: { minimum: 10, maximum: 70 }
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }

end
