class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_credentials(user_params[:username], user_params[:password])
    if user
      log_in!(user)
      redirect_to bands_url
    else
      flash.now[:errors] << user.errors.full_messages
    end
  end

  def destroy
    
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit()
  end
end
