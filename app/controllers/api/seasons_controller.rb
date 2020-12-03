class Api::SeasonsController < Api::ApiController
  skip_before_action :authenticate_user
  skip_before_action :authenticate_with_token!
  before_action :set_season, only: %i[show levels dictionaries]

  def index
    seasons = Season.all.order(tag: :asc)
    render json: seasons, status: 200
  end

  #deprecated
  def show
    levels = @season.levels.order(level: :asc)
    render json: levels, each_serializer: SimpleLevelSerializer, status: 200
  end

  def levels
    render json: @season, serializer: SeasonDetailSerializer, status: 200
  end

  def dictionaries
    dictionaries = @season.dictionaries
    render json: dictionaries
  end

  private
  def set_season
    @season = Season.find(params[:id])
  end
end
