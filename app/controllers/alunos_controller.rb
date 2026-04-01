class AlunosController < ApplicationController
  before_action :set_aluno, only: %i[ show update destroy ]

  # GET /alunos
  # GET /alunos.json
  def index
    @alunos = Aluno.where(status: 'enabled')
  end

  # GET /alunos/1
  # GET /alunos/1.json
  def show
  end

  # POST /alunos
  # POST /alunos.json
  def create
    @aluno = Aluno.new(aluno_params)

    if @aluno.save
      render :show, status: :created, location: @aluno
    else
      render json: @aluno.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /alunos/1
  # PATCH/PUT /alunos/1.json
  def update
    if @aluno.update(aluno_params)
      render :show, status: :ok, location: @aluno
    else
      render json: @aluno.errors, status: :unprocessable_entity
    end
  end

  # DELETE /alunos/1
  # DELETE /alunos/1.json
  def destroy
    @aluno.update_columns(status: 'disabled')
    @aluno.matriculas.update_all(status: 'disabled')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aluno
      @aluno = Aluno.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def aluno_params
      params.expect(aluno: [ :name, :cpf, :data_nascimento, :telefone, :gender, :payment_method, :email, :email_confirmation ])
    end
end
