class Api::PostsController < Api::ApiController
  def index
    posts = Post.all
    render json: posts, status: 200
  end

  def show
    post = Post.find(params[:id])
    render json: post, serializer: PostDetailSerializer, status: 200
  end

  def create
    post = Post.new(post_params)
    if post.save
      render json: post, status: :created
    else
      render json: { errors: post.errors.full_messages.to_sentence }, status: :unprocessable_entity
    end
  end

  private
  def post_params
    params.require(:post).permit(
      :title,
      :content
      # :type
    ).merge(status: "unapproved", user_id: current_user.id)
  end
end
