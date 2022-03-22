class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    user_kind = params.require(:user).permit(:kind)[:kind]

    user_params = filter_params(user_kind, params)
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render @user.errors, status: 422
    end
  end

  def update
    user_kind = params.require(:user).permit(:kind)[:kind]

    user_params = filter_params(user_kind)
    @user = User.find(params[:id])
    if @user.save
      render json: @user, status: :ok
    else
      render @user.errors, status: 422
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

  private

  #helper functions

  def filter_params(user_kind)
    if user_kind == 0
        params.require(:user).permit(:name, :nacionality, 
        :state, :rg, :cpf, :email, :password_digest, :birth_date, :street, :district, 
        :address_number, :address_complement, :cep, :phone, :mobile, :registration_number,
        :course_id, :kind)
    elsif user_kind == 1
        params.require(:user).permit(:name, :nacionality, 
        :state, :rg, :cpf, :email, :password_digest, :birth_date, :street, :district, 
        :address_number, :address_complement, :cep, :phone, :mobile, :registration_number,
        :department_id, :kind)
    elsif user_kind == 2
        params.require(:user).permit(:name, :nacionality, 
        :state, :rg, :cpf, :email, :password_digest, :birth_date, :street, :district, 
        :address_number, :address_complement, :cep, :phone, :mobile, :registration_number,
        :coordinator_type, :kind)
    elsif user_kind == 3
        params.require(:user).permit(:name, :nacionality, 
        :state, :rg, :cpf, :email, :password_digest, :birth_date, :street, :district, 
        :address_number, :address_complement, :cep, :phone, :mobile, :kind)
    end
  end

end
