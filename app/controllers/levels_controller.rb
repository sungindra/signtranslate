class LevelsController < ApplicationController
  before_action :set_level, only: %i[edit update destroy]
  def index
    @q = Level.all.ransack(params[:q])
    @pagy, @levels = pagy(@q.result.order(created_at: :asc), items: 25)
  end

  def new
    @level = Level.new
  end

  def edit; end

  def create
    @level = Level.new(level_params)
    if @level.save
      redirect_to levels_path, notice: 'Level successfully added'
    else
      render 'new'
    end
  end

  def update
    if @level.update(level_params)
      redirect_to levels_path, notice: 'Level successfully updated'
    else
      render 'edit'
    end
  end

  def destroy
    @level.destroy
    redirect_to levels_path, notice: 'Level successfully deleted'
  end

  private
  def level_params
    params.require(:level).permit(:season_id, :level, :video, :answer, :hint)
  end

  def set_level
    @level = Level.find(params[:id])
  end
end
