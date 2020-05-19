class Api::ApiController < ActionController::API
  serialization_scope :view_context
  respond_to :json
end