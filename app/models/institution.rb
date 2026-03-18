class Institution < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :cnpj, presence: true, uniqueness: true
  validades :tipo, presence: true, inclusion: {in: %w(Universidade Escola Creche)}
end
