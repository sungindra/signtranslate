class DictionariesController < ApplicationController
  before_action :set_dictionary, only: %i[edit update destroy]
  def index
    @q = Dictionary.all.ransack(params[:q])
    @pagy, @dictionaries = pagy(@q.result.order(created_at: :asc), items: 25)
  end

  def new
    @dictionary = Dictionary.new
  end

  def edit; end

  def create
    @dictionary = Dictionary.new(dictionary_params)
    if @dictionary.save
      redirect_to dictionaries_path, notice: 'Dictionary entry successfully added'
    else
      render 'new'
    end
  end

  def update
    if @dictionary.update(dictionary_params)
      redirect_to dictionaries_path, notice: 'Dictionary entry successfully updated'
    else
      render 'edit'
    end
  end

  def destroy
    @dictionary.destroy
    redirect_to dictionaries_path, notice: 'Dictionary entry successfully deleted'
  end

  private
  def dictionary_params
    params.require(:dictionary).permit(:meaning, :image, :season_id)
  end

  def set_dictionary
    @dictionary = Dictionary.find(params[:id])
  end
end
