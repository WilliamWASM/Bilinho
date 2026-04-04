class Fatura < ApplicationRecord
  belongs_to :matricula
  validates :vencimento,:status, presence:true
  validates :valor_fatura, presence:true, numericality:true
  validates :status,presence:true,inclusion: {in: %w(Aberta Atrasada Paga)}
  
  after_initialize :default_set, if: :new_record?
  after_find :att_se_atrasada

  private 
  
  def default_set
        self.status = "Aberta"
  end

  def att_se_atrasada
    if status == "Aberta" && vencimento < Date.today
      update_columns(status: "Atrasada")
      matricula.aluno.checar_inadimplencia!
    end
  end
end
