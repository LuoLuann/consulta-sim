class Address < ApplicationRecord
  belongs_to :patient

  validates :cep, presence: true, length: { is: 8, message: " deve conter 8 dígitos" }, numericality: { only_integer: true, message: " deve conter apenas números" }
  validates :city, presence: true, length: { minimum: 3, maximum: 255}
  validates :neighborhood, presence: true, length: { minimum: 3, maximum: 255}
  validates :street, presence: true, length: { minimum: 3, maximum: 255}
  validates :next, presence: true, length: { minimum: 3, maximum: 255}

end
