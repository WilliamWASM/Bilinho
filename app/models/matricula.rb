class Matricula < ApplicationRecord
  belongs_to :institution
  belongs_to :aluno
  validates :valor_total,presence:true
  validates :qtd_faturas,presence:true
  validates :dia_vencimento,presence:true
  validates :nome_curso,presence:true
  validates :institution_id,presence:true
  validates :aluno_id,presence:true 
end
