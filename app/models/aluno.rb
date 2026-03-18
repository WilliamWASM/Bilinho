class Aluno < ApplicationRecord
  validates :name, presence: true, uniqueness: {case_sensitive:false}
  validates :cpf, presence: true, uniqueness: true,numericality:true
  validates :data_nascimento, presence:true
  validates :email, presence:true,confirmation:{case_sensitive:false},uniqueness:{case_sensitive:false}
  validates :email_confirmation, presence:true, if: :email_changed?
  validates :telefone,presence:true,numericality:true
  validates :gender,presence:true, format: {with: /\A[MFmf]\z/}
  validates :payment_method,presence:true, inclusion: {in:%w(Boleto Cartao Pix)}
end
