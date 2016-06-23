require 'rails_helper'

RSpec.describe ExportController, type: :controller do

  describe "GET #token" do
    it "returns http not found for invalid token" do
      get :token, token: "invalid"
      expect(response).to have_http_status(404)
    end
  end

end
