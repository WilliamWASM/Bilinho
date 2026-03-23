class Institution < ApplicationRecord
  has_many :matriculas
  validates :name, presence: true, uniqueness: true
  validates :cnpj, presence: true, uniqueness: true,numericality: true
  validates :institution_type, presence: true, inclusion: {in: %w(Universidade Escola Creche)}
end
