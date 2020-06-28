class Api::UsersController < Api::ApiController
  skip_before_action :authenticate_user
  skip_before_action :authenticate_with_token!

  def create
    @user = User.new user_params
    if @user.save
      render json: @user, scope: {'jwt': true}, status: :created
    else
      render json: { errors: @user.errors.full_messages.to_sentence }, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation,
      :name
      # ,:push_token
    )
  end
end
