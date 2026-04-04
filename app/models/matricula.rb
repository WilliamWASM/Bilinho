require 'date'
class Matricula < ApplicationRecord
  belongs_to :institution
  belongs_to :aluno
  has_many :faturas
  validates :valor_total,presence:true, numericality:{greater_than:0}
  validates :qtd_faturas,presence:true, numericality: {greater_than_or_equal_to: 1}
  validates :dia_vencimento,presence:true, numericality:{greater_than_or_equal_to: 1, less_than_or_equal_to: 31}
  validates :nome_curso,presence:true
  validates :status, inclusion: {in: %w(enabled disabled)}
  
  validate :checar_aluno_ativo, on: :create
  validate :checar_instituicao_ativa, on: :create
  before_validation :entidade_create, on: :create
  after_create :criacao_faturas
  private

    def checar_aluno_ativo #aluno desabilitado não pode realizar matricula
      return errors.add(:aluno, "está desativado/inadimplente e não pode realizar novas matrículas") if aluno.status == 'disabled'
    end

    def checar_instituicao_ativa #instituicao desabilitada não pode receber matricula
      return errors.add(:institution, "está desativada e não pode receber novas matrículas") if institution.status == 'disabled'
    end
    
    def criacao_faturas #cria as faturas com a regra do vencimento
        valor_parcela = valor_total/qtd_faturas
        data_inicio = vencimento_fatura_regra
        qtd_faturas.times do |n|
            faturas.create!(
              vencimento: data_inicio + n.months,
              valor_fatura: valor_parcela,
              status: 'Aberta'
            )
        end
    end

    def vencimento_fatura_regra #regra do vencimento onde se a data do vencimento for menor que a data de hoje cai no proximo mes
      hoje = Date.today
          if dia_vencimento <= hoje.day
            hoje.next_month.change(day: dia_vencimento)
          else
            hoje.change(day: dia_vencimento)
          end
    rescue ArgumentError 
          hoje.next_month.end_of_month
    end
end
