class SignsController < ApplicationController
  before_action :set_sign, only: %i[edit update destroy]
  def index
    @q = Sign.all.ransack(params[:q])
    @pagy, @signs = pagy(@q.result.order(created_at: :asc), items: 25)
  end

  def new
    @sign = Sign.new
  end

  def edit; end

  def create
    @sign = Sign.new(sign_params)
    if @sign.save
      @sign.update(user_id: current_user.id)
      @sign.admin_submitted! if @sign.may_admin_submitted?
      redirect_to signs_path, notice: 'Kosa kata berhasil ditambahkan'
    else
      render 'new'
    end
  end

  def update
    if @sign.update(sign_params)
      redirect_to signs_path, notice: 'Kosa kata berhasil diperbaharui'
    else
      render 'edit'
    end
  end

  def destroy
    @sign.destroy
    redirect_to signs_path, notice: 'Kosa kata berhasil dihapus'
  end

  private
  def sign_params
    params.require(:sign).permit(:meaning,
                                 :image,
                                 :sign_type,
                                 :description,
                                 :category_id).merge(user: current_user)
  end

  def set_sign
    @sign = Sign.find(params[:id])
  end
end
