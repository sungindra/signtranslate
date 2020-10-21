class Api::LevelsController < Api::ApiController
  skip_before_action :authenticate_user
  skip_before_action :authenticate_with_token!

  def show
    level = Level.find(params[:id])
    render json: level, serializer: LevelSerializer, status: 200
  end
end
