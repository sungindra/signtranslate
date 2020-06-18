class SignsController < ApplicationController
  def index
    @q = Sign.all.ransack(params[:q])
    @pagy, @signs = pagy(@q.result.order(created_at: :asc), items: 25)
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end
