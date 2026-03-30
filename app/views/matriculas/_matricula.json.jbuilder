json.extract! matricula, :id, :valor_total, :qtd_faturas, :dia_vencimento, :nome_curso, :institution_id, :aluno_id, :status, :created_at, :updated_at
json.url matricula_url(matricula, format: :json)

json.faturas matricula.faturas do |fatura| #conseguir ver as faturas de determinada matricula
  json.extract! fatura, :id, :valor_fatura, :vencimento, :status, :created_at
end