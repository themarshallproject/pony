class SessionController < ApplicationController

  def token
    token = params[:token]

    if TokenAuthentication.valid?(token)
      cookies.signed[:token] = token
      redirect_to root_path
    else
      render text: "Unauthorized", status: 422
    end
  end

end
