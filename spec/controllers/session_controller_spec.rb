require 'rails_helper'

RSpec.describe SessionController, type: :controller do

  describe "GET #token" do
    it "returns http success" do
      get :token, token: 'invalid'
      expect(response).to have_http_status(422)
    end
  end

end
