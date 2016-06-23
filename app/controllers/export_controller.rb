class ExportController < ApplicationController
  def token
    email = Email.find_by(token: params[:token])
    if email.present?
      render inline: email.render
    else
      render text: "Not Found", status: 404
    end
  end
end
