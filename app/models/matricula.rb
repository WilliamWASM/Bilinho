class Matricula < ApplicationRecord
  belongs_to :institution
  belongs_to :aluno
  validates :valor_total,presence:true,comparison: greater_than(0),numericality:true
  validates :qtd_faturas,presence:true,comparison: greater_than_or_equal_to(1) ,numericality:true
  validates :dia_vencimento,presence:true,comparison: (greater_than_or_equal_to(1) and less_than_or_equal_to(31)), numericality:true
  validates :nome_curso,presence:true
  validates :institution_id,presence:true
  validates :aluno_id,presence:true
end
