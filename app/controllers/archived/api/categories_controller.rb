class Api::CategoriessController < Api::ApiController
  skip_before_action :authenticate_user
  skip_before_action :authenticate_with_token!

  def index
    categories = Category.all
    render json: categories, status: :ok
  end

  def show
    category = Category.find(params[:id])
    render json: category, serializer: SignDetailSerializer, status: 200
  end
end
