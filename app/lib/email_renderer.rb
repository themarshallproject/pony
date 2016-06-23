class EmailRenderer

  attr_reader :email
  def initialize(email: nil)
    @email = email
  end

  def content_html
    Kramdown::Document.new(email.content).to_html
  end

  def render
    assembled_html = [email.template.header, content_html, email.template.footer].join("\n")
    Roadie::Document.new(assembled_html).transform
  end

end
