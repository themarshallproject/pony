class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authorize!
    token = cookies.signed[:token]
    if TokenAuthentication.valid?(token)
      # everything okay
    else
      cookies.delete(:token)
      render text: "Unauthorized", status: 422
      return false
    end
  end

end
