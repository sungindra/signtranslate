class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  def index
    @q = User.all.ransack(params[:q])
    @pagy, @users = pagy(@q.result.order(created_at: :asc), items: 25)
  end

  def new
    @user = User.new
  end

  def edit; end

  def create
    if User.create(category_params)
      redirect_to users_path, notice: 'Kategori berhasil dibuat'
    else
      render 'new'
    end
  end

  def update
    if @user.update(usery_params)
      redirect_to users_path, notice: 'Kategori berhasil diperbarui'
    else
      render 'edit'
    end
  end

  def destroy
    # @user.destroy
    redirect_to users_path, notice: 'Kategori berhasil dihapus'
  end

  def ban
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:title)
  end
end
