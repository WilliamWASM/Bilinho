class Aluno < ApplicationRecord
  validates :name, presence: true, uniqueness: {case_sensitive:false}
  validates :cpf, presence: true, uniqueness: true,numericality:true
  validates :data_nascimento, presence:true
  validates :email, presence:true,confirmation:true,uniqueness:{case_sensitive:false}
  validates :email_confirmation, presence:true
  validates :telefone,presence:true,numericality:true
  validates :gender,presence:true, format: {with: /\A[MFmf]\z/}
  validates :payment_method,presence:true, inclusion: {in:%w(Boleto Cartao Pix)}

  before_validation :downcase_email

  def downcase_email
    email_confirmation.try(:downcase!)
    email.try(:downcase!)
  end

end 
