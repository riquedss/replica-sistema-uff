class CourseCoordinatorsController < ApplicationController
  before_action :verify_authenticated, :verify_director_authenticated, only: [:create, :update, :destroy]
  before_action :user_params, :is_right_kind, only: [:destroy, :create, :update]

  def index
    @course_coords = User.course_coordinator.all
    render json: @course_coords
  end

  def show
    @course_coord = User.course_coordinator.find(params[:id])
    render json: @course_coord
  end

  def create
    user_params[:kind] = course_coord_kind

    @course_coord = User.new(user_params)
    if @course_coord.save
      render json: @course_coord, status: :created
    else
      render json: @course_coord.errors, status: 422
    end

  end

  def update

    user_params[:kind] = course_coord_kind

    @course_coord = User.find(params[:id])

    if @course_coord.update(user_params)
      render json: @course_coord
    else
      render json: @course_coord.errors, status: 422
    end
  end

  def destroy
    @course_coord = User.find(params[:id])
    @course_coord.destroy
  end

  private

  def course_coord_kind
    return 3
  end

  def user_params
    params.require(:user).permit(:name, :nacionality, 
    :state, :rg, :cpf, :email, :password_digest, :birth_date, :street, :district, 
    :address_number, :address_complement, :cep, :phone, :mobile, :registration_number, :kind)
  end

  def is_right_kind
    render json: { message: "User is not of right kind" }, status: 403 and return unless (user_params[:kind] == 3)
  end
end
