class SeasonsController < ApplicationController
  before_action :set_season, only: %i[edit update destroy]
  def index
    @q = Season.all.ransack(params[:q])
    @pagy, @seasons = pagy(@q.result.order(created_at: :asc), items: 25)
  end

  def new
    @season = Season.new
  end

  def edit; end

  def create
    @season = Season.new(season_params)
    if @season.save
      redirect_to seasons_path, notice: 'Season successfully added'
    else
      render 'new'
    end
  end

  def update
    if @season.update(season_params)
      redirect_to seasons_path, notice: 'Season successfully updated'
    else
      render 'edit'
    end
  end

  def destroy
    @season.destroy
    redirect_to seasons_path, notice: 'Season successfully deleted'
  end

  private
  def season_params
    params.require(:season).permit(:title, :tag)
  end

  def set_season
    @season = Season.find(params[:id])
  end
end
