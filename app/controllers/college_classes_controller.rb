class CollegeClassesController < ApplicationController
  #Controller para as turmas
  before_action :set_college_class, only: [:show, :update, :destroy]

  def index
    render json: CollegeClass.all
  end

  def show
    render json: @college_classes
  end

  def create
    @college_class = CollegeClass.new(college_class_params)
    
    if(@college_class.save)
      render json: @college_class, status: :ok
    else
      render json: @college_class.errors, status: 422
    end
  end

  def update    
    if(@college_class.update(college_class_params))
      render json: @college_class, status: :ok
    else
      render json: @college_class.errors, status: 422
    end
  end

  def destroy
    @college_class.destroy
  end

  private 
  def set_college_class
    @college_class = CollegeClass.find(params[:id])
  end
  


  def college_class_params
    params.require(:college_class).permit(:name, :code, :calendar, :room, :user_id, :discipline_id, :department_id)
  end
end
