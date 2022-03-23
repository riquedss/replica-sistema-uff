class DirectorController < ApplicationController
  before_action :verify_authenticated, :verify_admin_authenticated, only: [:create, :update, :destroy]
  before_action :user_params, :is_right_kind, only: [:destroy, :create, :update]

  def show
    @director = User.director.all
    render json: @director
  end

  def create
    @course_coord = User.new(user_params)
    
    if @course_coord.save
      render json: @course_coord, status: :created
    else
      render json: @course_coord.errors, status: 422
    end
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:name, :nacionality, 
    :state, :rg, :cpf, :email, :password_digest, :birth_date, :street, :district, 
    :address_number, :address_complement, :cep, :phone, :mobile, :kind)
  end

  def is_right_kind
    render json: { message: "User is not of right kind" }, status: 403 and return unless (user_params[:kind] == 4)
  end
end
