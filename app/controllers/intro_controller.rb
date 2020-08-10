class IntroController < ApplicationController
  def index
    if user_signed_in?
      redirect_to user_path(current_user.id)
    end
  end

  def show
  end
end
