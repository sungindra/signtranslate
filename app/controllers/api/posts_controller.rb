class Api::PostsController < Api::ApiControllers
  def index
    posts = Post.all
    render json: signs, status: 200
  end

  def show
    sign = Sign.find(params[:id])
    render json: sign, serializer: SignDetailSerializer, status: 200
  end
end
