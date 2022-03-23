class DepartmentCoordinatorsController < ApplicationController
  before_action :verify_authenticated, :verify_director_authenticated, only: [:create, :update, :destroy]
  before_action :user_params, :is_right_kind, only: [:destroy, :create, :update]

  def index
    @dept_coords = User.department_coordinator.all
    render json: @dept_coords
  end

  def show
    @dept_coord = User.find(params[:id])
    render json: @dept_coord
  end

  def create
    user_params[:kind] = dept_coord_kind

    @dept_coord = User.new(user_params)
    if @dept_coord.save
      render json: @dept_coord, status: :created
    else
      render json: @dept_coord.errors, status: 422
    end

  end

  def update
    user_params[:kind] = dept_coord_kind

    @dept_coord = User.find(params[:id])

    if @dept_coord.update(user_params)
      render json: @dept_coord
    else
      render json: @dept_coord.errors, status: 422
    end
  end

  def destroy
    @dept_coord = User.find(params[:id])
    @dept_coord.destroy
  end

  private

  def dept_coord_kind
    return 2
  end

  def user_params
    params.require(:user).permit(:name, :nacionality, 
    :state, :rg, :cpf, :email, :password_digest, :birth_date, :street, :district, 
    :address_number, :address_complement, :cep, :phone, :mobile, :registration_number, :kind)
  end

  def is_right_kind
    render json: { message: "User is not of right kind" }, status: 403 and return unless (user_params[:kind] == 2)
  end
end
