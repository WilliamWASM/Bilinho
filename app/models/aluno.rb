class Aluno < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :cpf, presence: true, uniqueness: true
end
