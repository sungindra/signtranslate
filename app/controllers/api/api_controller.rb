class Api::ApiController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  serialization_scope :view_context
  respond_to :json
  before_action :authenticate_user
  before_action :authenticate_with_token!

	private
  def authenticate_user
		if request.headers['Authorization'].present?
			authenticate_or_request_with_http_token do |token|
				begin
					jwt_payload = JWT.decode(token, "secret").first

					@current_user_id = jwt_payload['id']
				rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
					return
				end
			end
		else
			render json: { errors: 'Missing token' }, status: :unauthorized
		end
	end

  def authenticate_with_token!
		unless signed_in? && current_user
			render json: {errors: 'Not Authenticated'}, status: :unauthorized
		end
	end

	def current_user
		@current_user ||= super || User.find_by(id: @current_user_id)
	end

	def signed_in?
		@current_user_id.present?
  end
end
