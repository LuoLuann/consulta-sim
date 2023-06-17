class Patient < ApplicationRecord
  has_one :address
  accepts_nested_attributes_for :address

  has_many :consultations

  validates :fullname, presence: true, length: { minimum: 10, maximum: 255}, format: { with: /\A[a-zA-Z]+\z/. message: "Deve conter apenas letras" }
  validates :email, presence: { message: "O e-mail é obrigatório"}, uniqueness: { message: "Este e-mail já está em uso" }, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, message: "O e-mail possui um formato inválido" }
  validates_date :birthdate, presence: { message: "A data de nascimento é obrigatória" } , on_or_before: lambda { Date.current }, on_or_after: lambda { 120.years.ago }
  validates :cpf, presence: true, uniqueness: true, lenght: { is: 11 }, numerically: ( only_integer: true, message: "O CPF deve conter apenas números" )


end
