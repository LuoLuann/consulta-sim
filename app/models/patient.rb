class Patient < ApplicationRecord
  has_one :address
  accepts_nested_attributes_for :address


  validates :fullname, presence: true, length: { minimum: 10, maximu: 70}
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }

end
