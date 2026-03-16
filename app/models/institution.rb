class Institution < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :cnpj, presence: true, uniqueness: true
end
