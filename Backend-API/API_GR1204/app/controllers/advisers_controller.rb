class AdvisersController < ApplicationController
  before_action :set_adviser, only: [:show, :update, :destroy]

  # GET /advisers
  def index
    @advisers = Adviser.all

    render json: @advisers
  end

  # GET /advisers/1
  def show
    render json: @adviser
  end

  # POST /advisers
  def create
    @adviser = Adviser.new(adviser_params)

    if @adviser.save
      render json: @adviser, status: :created, location: @adviser
    else
      render json: @adviser.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /advisers/1
  def update
    if @adviser.update(adviser_params)
      render json: @adviser
    else
      render json: @adviser.errors, status: :unprocessable_entity
    end
  end

  # DELETE /advisers/1
  def destroy
    @adviser.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adviser
      @adviser = Adviser.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def adviser_params
      params.require(:adviser).permit(:user_id, :area_id)
    end
end
