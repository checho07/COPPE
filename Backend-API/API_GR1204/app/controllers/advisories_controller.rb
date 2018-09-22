class AdvisoriesController < ApplicationController
  before_action :set_advisory, only: [:show, :update, :destroy]

  # GET /advisories
  def index
    @advisories = Advisory.all

    render json: @advisories
  end

  # GET /advisories/1
  def show
    render json: @advisory
  end

  # POST /advisories
  def create
    @advisory = Advisory.new(advisory_params)

    if @advisory.save
      render json: @advisory, status: :created, location: @advisory
    else
      render json: @advisory.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /advisories/1
  def update
    if @advisory.update(advisory_params)
      render json: @advisory
    else
      render json: @advisory.errors, status: :unprocessable_entity
    end
  end

  # DELETE /advisories/1
  def destroy
    @advisory.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advisory
      @advisory = Advisory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def advisory_params
      params.require(:advisory).permit(:type_advisory, :adviser_id, :project_id)
    end
end
