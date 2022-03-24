class DepartmentsController < ApplicationController
  before_action :verify_authenticated, only: [:index, :show, :create, :update, :delete]
  before_action :set_department, only: [:show, :update, :delete]
  before_action :verify_director_authenticated, only: [:create, :delete]
  before_action :verify_dept_coord_authenticated, only: [:show, :index]
  before_action :is_derpt_coord_of_this_derpt_or_director, only: [:update]

  def index
    @departments = Department.all
    render json: @departments
  end

  def show
    render json: @department
  end

  def create
    @department = Department.new(params_department)
    @department.code = Department.generate_code
    if @department.save
      render json: @department, status: :created
    else 
      render json: @department.errors, status: :not_found
    end
  end

  def update
    if @department.update(params_department)
      render json: @department, status: :ok
    else 
      render json: @department.errors, status: :unprocessable_entity
    end
  end

  def delete
    def delete
      if @department.destroy
        render json: { message: "deleted" }, status: :ok
      else
        render json: @period.errors, status: :not_found
      end
    end
  end
  
  def set_department
    @department = Department.find(params[:id])
  end

  private
  def params_department
    params.require(:department).permit(:name, :knowledge_area, :campus, :user_id)
  end

end

