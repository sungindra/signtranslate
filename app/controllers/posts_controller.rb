class PostsController < ApplicationController
  before_action :set_post, except: %i[index new create approve]
  def index
    posts = params[:status] ? Post.where(status: params[:status]) : Post.all
    @q = posts.includes(:user).ransack(params[:q])
    @pagy, @posts = pagy(@q.result.order(created_at: :desc), items: 25)

    @type = params[:status] ? params[:status] == "unapproved" ? "Belum Diperiksa" : "Sudah Diterima" : "Semua"
  end

  def show
    @answers = Sign.where(post: @post)
  end

  def new
    @post = Post.new
  end

  def create
    if @post.create(post_params)
      redirect_to posts_path, notice: 'Forum berhasil diperbaharui'
    else
      render 'edit'
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: 'Forum berhasil diperbaharui'
    else
      render 'edit'
    end
  end

  def destroy
  end

  def approve
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end
end