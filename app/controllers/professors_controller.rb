class ProfessorsController < ApplicationController
  before_action :verify_authenticated, :verify_dept_coord_authenticated, only: [:create, :update, :destroy]
  before_action :user_params, :is_right_kind, only: [:destroy, :create, :update]

  def index
    @professors = User.professor.all
    render json: @professors
  end

  def show
    @professor = User.find(params[:id])
    render json: @professor
  end

  def create
    user_params[:kind] = professor_kind

    @professor = User.new(user_params)
    if @professor.save
      render json: @professor, status: :created
    else
      render json: @professor.errors, status: 422
    end

  end

  def update
    user_params[:kind] = professor_kind

    @professor = User.find(params[:id])

    if @professor.update(user_params)
      render json: @professor
    else
      render json: @professor.errors, status: 422
    end
  end

  def destroy
    @professor = User.find(params[:id])
    @professor.destroy
  end

  private

  def professor_kind
    return 1
  end

  def user_params
    params.require(:user).permit(:name, :nacionality, 
    :state, :rg, :cpf, :email, :password_digest, :birth_date, :street, :district, 
    :address_number, :address_complement, :cep, :phone, :mobile, :registration_number, :kind, :department_id)
  end

  def is_right_kind
    render json: { message: "User is not of right kind" }, status: 403 and return unless (user_params[:kind] == 1)
  end
end
