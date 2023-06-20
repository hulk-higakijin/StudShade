class HomeController < ApplicationController
  def index
    redirect_to questions_path if user_signed_in?
  end
end
