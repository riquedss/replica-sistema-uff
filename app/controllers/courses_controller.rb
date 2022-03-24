class CoursesController < ApplicationController
  #Controller para as turmas
  before_action :set_course, only: [:show, :update, :destroy]

  def index
    render json: Course.all
  end

  def show
    render json: @course
  end

  def create
    @course = Course.new(course_params)
    
    if(@course.save)
      render json: @course, status: :ok
    else
      render json: @course.errors, status: 422
    end
  end

  def update    
    if(@course.update(course_params))
      render json: @course, status: :ok
    else
      render json: @course.errors, status: 422
    end
  end

  def destroy
    @course.destroy
  end

  private 
  def set_course
    @course = Course.find(params[:id])
  end
  


  def course_params
    params.require(:course).permit(:name, :knowledge_area, :code, :campus, :user_id)
  end
end
