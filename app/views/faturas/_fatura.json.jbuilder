json.extract! fatura, :id, :valor_fatura, :vencimento, :status, :matricula_id, :created_at, :updated_at
json.url fatura_url(fatura, format: :json)
