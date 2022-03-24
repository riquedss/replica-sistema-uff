class AuthController < ApplicationController

  def login
    @user = User.find_by!(cpf: login_params[:cpf])

    if @user.password_digest == login_params[:password]
      token = JsonWebToken::Base.encode(user_id: @user.id)
      render json: {token: token}, status: :ok
    else

      render json: {message: "Incorrect Password or Cpf" }, status: 401
    end
  end

  def login_params
    params.require(:user).permit(:cpf, :password)
  end
end
