class Aluno < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :cpf, presence: true, uniqueness: true,numericality:true
  validates :data_nascimento, presence:true
  validates :email, presence:true,confirmation:true,uniqueness:true
  validates :email_confirmation, presence:true, if: :email_changed?
  validates :telefone,presence:true
  validates :gender,presence:true, format: {with: /\A[MFmf]\z/}
  validates :payment_method,presence:true, inclusion: {in:%w(Boleto Cartao Pix)}
end
