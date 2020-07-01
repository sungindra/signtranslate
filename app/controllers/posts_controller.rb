class PostsController < ApplicationController
  def index
    @q = Post.all.includes(:user).ransack(params[:q])
    @pagy, @posts = pagy(@q.result.order(created_at: :desc), items: 25)
  end

  def show
    @post = Post.includes(:user).find(params[:id])
    @answers = Sign.where(post: @post)
  end

  def approve
  end
end