class Api::SessionsController < Api::ApiController
  skip_before_action :authenticate_user
  skip_before_action :authenticate_with_token!

  def create
    email = params[:user][:email]
    password = params[:user][:password]
    @user = User.authenticate(email, password)
    if @user 
      # if !@user.banned
      # if params[:user][:push_token]
      #   @user.update(push_token: params[:user][:push_token])
      # end
      render json: @user, scope: { 'jwt': true }, status: 201
      # else
      #   render json: { errors: 'Akun anda ditangguhkan' }, status: 422
      # end
    else
      render json: { errors: 'Email/Password tidak valid' }, status: 422
    end
  end

  def destroy
    # current_user.clear_push_notification!
    head :no_content
  end
end