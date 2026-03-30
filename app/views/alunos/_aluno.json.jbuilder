json.extract! aluno, :id, :name, :cpf, :data_nascimento, :telefone, :gender, :payment_method, :email, :created_at, :updated_at, :status
json.url aluno_url(aluno, format: :json)
