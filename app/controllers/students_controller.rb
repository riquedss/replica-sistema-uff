class StudentsController < ApplicationController
  before_action :verify_authenticated, :verify_course_coord_authenticated, only: [:create, :update, :destroy]
  before_action :user_params, :is_right_kind, only: [:destroy, :create, :update]

  def index
    @students = User.student.all
    render json: @students
  end

  def show
    @student = User.find(params[:id])
    render json: @student
  end

  def create
    user_params = params.require(:user).permit(:name, :nacionality, 
    :state, :rg, :cpf, :email, :password_digest, :birth_date, :street, :district, 
    :address_number, :address_complement, :cep, :phone, :mobile, :registration_number, :course_id)

    user_params[:kind] = student_kind

    @student = User.new(user_params)
    if @student.save
      render json: @student, status: :created
    else
      render json: @student.errors, status: 422
    end

  end

  def update
    user_params = params.require(:user).permit(:name, :nacionality, 
    :state, :rg, :cpf, :email, :password_digest, :birth_date, :street, :district, 
    :address_number, :address_complement, :cep, :phone, :mobile, :registration_number, :course_id)

    user_params[:kind] = student_kind

    @student = User.find(params[:id])

    if @student.update(user_params)
      render json: @student
    else
      render json: @student.errors, status: 422
    end
  end

  def destroy
    @student = User.find(params[:id])
    @student.destroy
  end

  private

  def student_kind
    return 0
  end

  def user_params
    params.require(:user).permit(:name, :nacionality, 
    :state, :rg, :cpf, :email, :password_digest, :birth_date, :street, :district, 
    :address_number, :address_complement, :cep, :phone, :mobile, :registration_number, :kind, :course_id)
  end

  def is_right_kind
    render json: { message: "User is not of right kind" }, status: 403 and return unless (user_params[:kind] == 0)
  end
end
