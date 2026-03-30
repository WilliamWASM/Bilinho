json.extract! institution, :id, :name, :cnpj, :institution_type, :created_at, :updated_at, :status
json.url institution_url(institution, format: :json)
