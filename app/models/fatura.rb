class Fatura < ApplicationRecord
  belongs_to :matricula
  validates :vencimento,:status, presence:true
  validates :valor_fatura, presence:true, numericality:true
  validates :status,presence:true,inclusion: {in: %w(Aberta Atrasada Paga)}
  
  after_initialize :default_set, if: :new_record?

  private def default_set
        self.status = "Aberta"
  end
end
