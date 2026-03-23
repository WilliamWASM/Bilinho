class Aluno < ApplicationRecord
  has_many :matriculas
  validates :name, presence: true, uniqueness: {case_sensitive:false}
  validates :cpf, presence: true, uniqueness: true,numericality:true
  validates :data_nascimento, presence:true
  validates :email, presence:true,confirmation:true,uniqueness:{case_sensitive:false}
  validates :email_confirmation, presence:true
  validates :telefone,presence:true,numericality:true
  validates :gender,presence:true, format: {with: /\A[mf]\z/}
  validates :payment_method,presence:true, inclusion: {in:%w(boleto cartao pix)}

  before_validation :normalize
  
  def normalize
      self.payment_method.try(:downcase!) #pagamento
      self.email_confirmation.try(:downcase!)#email de confirmação
      self.email.try(:downcase!)#email
      self.gender.try(:downcase!)#genero
  end
  

end 
