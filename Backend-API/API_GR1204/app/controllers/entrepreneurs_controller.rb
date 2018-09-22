class EntrepreneursController < ApplicationController
  before_action :set_entrepreneur, only: [:show, :update, :destroy]

  # GET /entrepreneurs
  def index
    @entrepreneurs = Entrepreneur.all

    render json: @entrepreneurs
  end

  # GET /entrepreneurs/1
  def show
    render json: @entrepreneur
  end

  # POST /entrepreneurs
  def create
    @entrepreneur = Entrepreneur.new(entrepreneur_params)

    if @entrepreneur.save
      render json: @entrepreneur, status: :created, location: @entrepreneur
    else
      render json: @entrepreneur.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /entrepreneurs/1
  def update
    if @entrepreneur.update(entrepreneur_params)
      render json: @entrepreneur
    else
      render json: @entrepreneur.errors, status: :unprocessable_entity
    end
  end

  # DELETE /entrepreneurs/1
  def destroy
    @entrepreneur.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entrepreneur
      @entrepreneur = Entrepreneur.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def entrepreneur_params
      params.require(:entrepreneur).permit(:name_entre, :lastname_entre, :cc_entre, :phone_entre, :address_entre, :age_entre_int, :email_entre, :neighborhood_id)
    end
end
