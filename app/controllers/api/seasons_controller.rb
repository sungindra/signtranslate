class Api::SeasonsController < Api::ApiController
  skip_before_action :authenticate_user
  skip_before_action :authenticate_with_token!

  def index
    seasons = Season.all
    render json: seasons, status: 200
  end

  def show
    levels = Season.find(params[:id]).levels
    render json: levels, each_serializer: SimpleLevelSerializer, status: 200
  end
end
