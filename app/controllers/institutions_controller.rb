class InstitutionsController < ApplicationController
  before_action :set_institution, only: %i[ show update destroy ]

  # GET /institutions
  # GET /institutions.json
  def index
    @institutions = Institution.all
  end

  # GET /institutions/1
  # GET /institutions/1.json
  def show
  end

  # POST /institutions
  # POST /institutions.json
  def create
    @institution = Institution.new(institution_params)

    if @institution.save
      render :show, status: :created, location: @institution
    else
      render json: @institution.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /institutions/1
  # PATCH/PUT /institutions/1.json
  def update
    if @institution.update(institution_params)
      render :show, status: :ok, location: @institution
    else
      render json: @institution.errors, status: :unprocessable_entity
    end
  end

  # DELETE /institutions/1
  # DELETE /institutions/1.json
  def destroy
    @institution.update_columns(status: 'disabled')
    @institution.matriculas.update_all(status: 'disabled')
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_institution
      @institution = Institution.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def institution_params
      params.expect(institution: [ :name, :cnpj, :institution_type ])
    end
end
