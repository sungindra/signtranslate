class Api::SignsController < Api::ApiController
  def index
    # signs = Sign.all
    # render json: signs, status: 200
    categories = Category.all
    render json: categories, status: :ok
  end

  def show
    sign = Sign.find(params[:id])
    render json: sign, serializer: SignDetailSerializer, status: 200
  end
end