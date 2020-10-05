class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update, :destroy]
  def index
    @q = Category.where.not(title: "Default").ransack(params[:q])
    @pagy, @categories = pagy(@q.result.order(created_at: :asc), items: 25)
  end

  def new
    @category = Category.new
  end

  def edit; end

  def create
    if Category.create(category_params)
      redirect_to categories_path, notice: 'Kategori berhasil dibuat'
    else
      render 'new'
    end
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path, notice: 'Kategori berhasil diperbarui'
    else
      render 'edit'
    end
  end

  def destroy
    default_category = Category.find_by(title: "Default")
    @category.signs.each do |sign|
      sign.update!(category: default_category)
      byebug
    end
    Category.find(@category.id).destroy  #@category.signs is not updated, signs will destroyed as well
    redirect_to categories_path, notice: 'Kategori berhasil dihapus'
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title)
  end
end
