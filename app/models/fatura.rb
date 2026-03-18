class Fatura < ApplicationRecord
  belongs_to :matricula
  validates :matricula_id,:valor_fatura,:vencimento,:status, presence:true
  validates :status,presence:true,inclusion: {in: %w(Aberta Atrasada Paga)}

  private def default_set
        self.status = "Aberta"
  end
end
