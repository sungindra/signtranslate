class PagesController < ApplicationController
  before_action :authenticate_user!

  def index
    redirect_to :signs
  end
end
