class EntrepCoursesController < ApplicationController
  before_action :set_entrep_course, only: [:show, :update, :destroy]

  # GET /entrep_courses
  def index
    @entrep_courses = EntrepCourse.all

    render json: @entrep_courses
  end

  # GET /entrep_courses/1
  def show
    render json: @entrep_course
  end

  # POST /entrep_courses
  def create
    @entrep_course = EntrepCourse.new(entrep_course_params)

    if @entrep_course.save
      render json: @entrep_course, status: :created, location: @entrep_course
    else
      render json: @entrep_course.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /entrep_courses/1
  def update
    if @entrep_course.update(entrep_course_params)
      render json: @entrep_course
    else
      render json: @entrep_course.errors, status: :unprocessable_entity
    end
  end

  # DELETE /entrep_courses/1
  def destroy
    @entrep_course.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entrep_course
      @entrep_course = EntrepCourse.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def entrep_course_params
      params.require(:entrep_course).permit(:course_id, :entrepreneur_id)
    end
end
