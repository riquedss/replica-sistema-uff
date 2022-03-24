class ClassEnrollmentsController < ApplicationController
  before_action :set_class_enrollment, only: [:show, :destroy]

  def index
    render json: ClassEnrollment.all
  end

  def show
    render json: @class_enrollment
  end

  def create
    @class_enrollment = ClassEnrollment.new(class_enrollment_params)
    
    if(@class_enrollment.save)
      render json: @class_enrollment, status: :ok
    else
      render json: @class_enrollment.errors, status: 422
    end
  end

  def destroy
    @class_enrollment.destroy
  end

  private 
  def set_class_enrollment
    @class_enrollment = ClassEnrollment.find(params[:id])
  end
  
  def class_enrollment_params
    params.require(:class_enrollment).permit(:user_id, :college_class_id)
  end
end
