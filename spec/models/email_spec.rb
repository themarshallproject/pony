require 'rails_helper'

RSpec.describe Email, type: :model do
  describe "#render" do
    it "can render a basic email" do
      template = Template.create(title: "test", header: "<!DOCTYPE html><html><head><style>p{color:red;}</style></head><body>", footer: "</body></html>")
      email = Email.create(title: "test", template: template, content: "content")
      expect(email.render).to eq("<!DOCTYPE html>\n<html>\n<head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\"></head>\n<body>\n<p style=\"color:red\">content</p>\n\n</body>\n</html>\n")
    end
  end

  it "is invalid without a template" do
    email = Email.create
    expect(email).to be_invalid
  end

  it "is valid with a template" do
    template = Template.create
    email = Email.create(template: template)
    expect(email).to be_valid
  end

  it "has a generated token" do
    email = Email.create(template: Template.new)
    expect(email.token.length).to eq 40
  end

  it "is not archived" do
    email = Email.create(template: Template.new)
    expect(email.is_archived?).to be false
  end

  it "can be archived" do
    template = Template.create(title: SecureRandom.hex)
    email = Email.create(template: template)
    expect(email.is_archived?).to be false

    email.is_archived = true

    # expect(email.is_archived).to be true
    expect(email.is_archived?).to be true
  end
end
