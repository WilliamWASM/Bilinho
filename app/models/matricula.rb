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
  
  before_validation :entidade_create, on: :create
  after_create :criacao_faturas
  private
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
