class Doctor < ApplicationRecord
  has_many :consultations

  validates :fullname, presence: true, length: { minimum: 10, maximum: 255 }, format: { with: /\A[a-zA-Z]+\z/, message: "Deve conter apenas letras" }
  validates :email, presence: { message: "O e-mail é obrigatório"}, uniqueness: { message: "Este e-mail já está em uso" }, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, message: "O e-mail possui um formato inválido" }
  validates :cpf, presence: { message: "O CPF é obrigatória" }, uniqueness: { message: "Este CPF já está em uso" }, lenght: { is: 11 }, numerically: ( only_integer: true, message: "O CPF deve conter apenas números" )
  validates :specialty, presence: true, length: { minimum: 7, maximum: 255 }, format: { with: /\A[a-zA-Z]+\z/. }
  validate :crm , presence: { message: "O CRM é obrigatório" }, uniqueness: { message: "Este CRM já está em uso" }, lenght: { is: 6 }, numerically: { only_integer: true }

end
