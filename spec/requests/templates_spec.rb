require 'rails_helper'

RSpec.describe "Templates", type: :request do
  before(:each) do
    get new_session_path(token: TokenAuthentication.tokens.first)
  end

  describe "GET /templates" do
    it "works! (now write some real specs)" do
      get templates_path
      expect(response).to have_http_status(200)
    end
  end
end
