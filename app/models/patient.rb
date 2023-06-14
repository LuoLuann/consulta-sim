class Patient < ApplicationRecord

  validates :fullname, presence: true, length: { minimum: 10, maximu: 70}
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }

end
