class Institution < ApplicationRecord
  require 'cpf_cnpj'
  has_many :matriculas
  validates :name, presence: true, uniqueness: true
  validates :cnpj, presence: true, uniqueness: true,numericality: true, cnpj: true
  validates :institution_type, presence: true, inclusion: {in: %w(Universidade Escola Creche)}
  validates :status, inclusion: {in: %w(enabled disabled)}

  before_validation :entidade_create, on: :create
end
