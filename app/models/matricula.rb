class Matricula < ApplicationRecord
  belongs_to :institution
  belongs_to :aluno
end
