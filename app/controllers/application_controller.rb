class ApplicationController < ActionController::Base
  # GET /
  def index
    @user = session[:current_user]
  end

  # GET /login
  def login
    if session[:current_user]
      redirect_to '/'
    else
      @user = User.new
    end
  end
end
