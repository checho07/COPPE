class CompaniesCitiesController < ApplicationController
  before_action :set_companies_city, only: [:show, :update, :destroy]

  # GET /companies_cities
  def index
    @companies_cities = CompaniesCity.all

    render json: @companies_cities
  end

  # GET /companies_cities/1
  def show
    render json: @companies_city
  end

  # POST /companies_cities
  def create
    @companies_city = CompaniesCity.new(companies_city_params)

    if @companies_city.save
      render json: @companies_city, status: :created, location: @companies_city
    else
      render json: @companies_city.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /companies_cities/1
  def update
    if @companies_city.update(companies_city_params)
      render json: @companies_city
    else
      render json: @companies_city.errors, status: :unprocessable_entity
    end
  end

  # DELETE /companies_cities/1
  def destroy
    @companies_city.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_companies_city
      @companies_city = CompaniesCity.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def companies_city_params
      params.require(:companies_city).permit(:company_id, :city_id)
    end
end
