class MatriculasController < ApplicationController
  before_action :set_matricula, only: %i[ show update destroy ]

  # GET /matriculas
  # GET /matriculas.json
  def index
    @matriculas = Matricula.all
    render json: @matriculas, status: :ok
  end

  # GET /matriculas/1
  # GET /matriculas/1.json
  def show
  end

  # POST /matriculas
  # POST /matriculas.json
  def create
    @matricula = Matricula.new(matricula_params)

    if @matricula.save
      render :show, status: :created, location: @matricula
    else
      render json: @matricula.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /matriculas/1
  # PATCH/PUT /matriculas/1.json
  def update
    if @matricula.update(matricula_params)
      render :show, status: :ok, location: @matricula
    else
      render json: @matricula.errors, status: :unprocessable_entity
    end
  end

  # DELETE /matriculas/1
  # DELETE /matriculas/1.json
  def destroy
    @matricula.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_matricula
      @matricula = Matricula.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def matricula_params
      params.expect(matricula: [ :valor_total, :qtd_faturas, :dia_vencimento, :nome_curso, :institution_id, :aluno_id ])
    end
end
