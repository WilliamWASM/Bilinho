class Fatura < ApplicationRecord
  belongs_to :matricula
  validates :matricula_id,:vencimento,:status, presence:true
  validates :valor_fatura, presence:true, numericality:true
  validates :status,presence:true,inclusion: {in: %w(Aberta Atrasada Paga)}
  
  private def default_set
        self.status = "Aberta"
  end
end
