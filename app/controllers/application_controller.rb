class ApplicationController < ActionController::Base
  include Pagy::Backend
  protect_from_forgery with: :exception
  # before_action :set_unapproved_forum

  # private
  # def set_unapproved_forum
  #   @unapproved_forum = Post.unapproved.count
  # end
end
