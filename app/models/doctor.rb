class Doctor < ApplicationRecord
  has_many :consultations

  validates :fullname, presence: true, length: { minimum: 10, maximum: 255 }, format: { with: /\A[a-zA-Z]+\z/, message: " deve conter apenas letras" }
  validates :email, presence: { message: "O e-mail é obrigatório"}, uniqueness: { message: " já está em uso" }, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, message: " possui um formato inválido" }
  validates :cpf, presence: { message: " é obrigatório" }, uniqueness: { message: " já está em uso" }, length: { is: 11, message: " deve conter 11 dígitos" }, numericality: { only_integer: true, message: " deve conter apenas números" }
  validates :specialty, presence: true, length: { minimum: 7, maximum: 255 }, format: { with: /\A[a-zA-Z\s]+\z/ }
  validates :crm , presence: { message: " é obrigatório" }, uniqueness: { message: " já está em uso" }, length: { is: 6 }, numericality: { only_integer: true }

end
