class FaturasController < ApplicationController
  before_action :set_fatura, only: %i[ show update destroy ]

  # GET /faturas
  # GET /faturas.json
  def index
    @faturas = Fatura.all
  end

  # GET /faturas/1
  # GET /faturas/1.json
  def show
  end

  # POST /faturas
  # POST /faturas.json
  def create
    @fatura = Fatura.new(fatura_params)
    if @fatura.save
      render :show, status: :created, location: @fatura
    else
      render json: @fatura.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /faturas/1
  # PATCH/PUT /faturas/1.json
  def update
    @fatura = Fatura.find(params[:id])
    if @fatura.update(fatura_params)
      render :show, status: :ok, location: @fatura
    else
      render json: @fatura.errors, status: :unprocessable_entity
    end
  end

  # DELETE /faturas/1
  # DELETE /faturas/1.json
  def destroy
    @fatura.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fatura
      @fatura = Fatura.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def fatura_params
      params.expect(fatura: [ :valor_fatura, :vencimento, :status, :matricula_id ])
    end
end
