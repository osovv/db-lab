class ApplicationController < ActionController::Base
  helper_method :need_auth

  def need_auth(url: root_path, message: "You have to sign in to be able to do this!", &block)
    if user_signed_in?
      block.call
    else
      redirect_to url, alert: message
    end
  end
end
