class AuthController < ApplicationController

  def login
    @user = User.find_by!(email: login_params[:email])

    if @user.password_digest == login_params[:password]
      token = JsonWebToken::Base.encode(user_id: @user.id)
      render json: {token: token}, status: :ok
    else

      render json: {message: "Incorrect Password" }, status: 401
    end
  end

  def login_params
    params.require(:user).permit(:email, :password)
  end
end
