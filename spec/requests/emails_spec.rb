require 'rails_helper'

RSpec.describe "Emails", type: :request do

  before(:each) do
    get new_session_path(token: TokenAuthentication.tokens.first)
  end

  describe "GET /emails" do
    it "works! (now write some real specs)" do
      get emails_path
      expect(response).to have_http_status(200)
    end
  end

  it "can be exported via URL with token" do
    header  = "header_#{SecureRandom.hex}"
    content = "content_#{SecureRandom.hex}"
    footer  = "footer_#{SecureRandom.hex}"

    template = Template.create(header: header, footer: footer)
    email = Email.create(template: template, content: content)

    get token_export_path(token: email.token)

    expect(response.body).to include(header)
    expect(response.body).to include(content)
    expect(response.body).to include(footer)
  end

end
