class Aluno < ApplicationRecord
  require 'cpf_cnpj'
  require 'validators'
  has_many :matriculas
  has_many :faturas
  validates :name, presence: true, uniqueness: {case_sensitive:false}
  validates :cpf, presence: true, uniqueness: true,cpf:true, numericality:true
  validates :data_nascimento, presence:true
  validates :email, presence:true,confirmation:true,uniqueness:{case_sensitive:false}, email: true
  validates :email_confirmation, presence:true
  validates :telefone,presence:true,numericality:true
  validates :gender,presence:true, format: {with: /\A[mf]\z/}
  validates :payment_method,presence:true, inclusion: {in:%w(boleto cartao pix)}
  validates :status, inclusion: {in: %w(enabled disabled)}

  before_validation :entidade_create, on: :create
  before_validation :normalize

  private
    
    def checar_inadimplencia!# testar criando uma fatura atrasada e ver se o aluno é desabilitado estaticamente mesmo
      faturas_atrasadas = self.faturas.where(status: 'Atrasada').count

      if faturas_atrasadas >=3 && self.status == 'enabled'
        self.update_columns(status: 'disabled')
        self.matriculas.update_all(status: 'disabled')
      end
    end

    def normalize
        data_nascimento.strftime("%d/%m/%Y")
        # Date.strptime(data_nascimento, '%d-%m-%Y')#data formatação certa
        self.payment_method.try(:downcase!) #pagamento
        self.email.try(:downcase!)#email
        self.email_confirmation.try(:downcase!)#email de confirmação
        self.gender.try(:downcase!)#genero
    end
end