class UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  # def create
  #   user_kind = params.require(:user).permit(:kind)[:kind]

  #   user_params = filter_params(user_kind)
  #   @user = User.new(user_params)

  #   if @user.save
  #     render json: @user, status: :created
  #   else
  #     render @user.errors, status: 422
  #   end
  # end

  # def update
    
  #   @user = User.new(user_params)
  #   if @user.save
  #     render json: @user, status: :ok
  #   else
  #     render @user.errors, status: 422
  #   end
  # end

  # def destroy
  #   user_kind = params.require(:user).permit(:kind)[:kind]

  #   @user = User.find(params[:id])
  #   @user.destroy
  # end

end
