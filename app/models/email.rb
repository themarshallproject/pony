class Email < ActiveRecord::Base
  belongs_to :template
  validates :template, presence: true

  before_create {
    self.token = SecureRandom.urlsafe_base64(30)
  }

  def render
    EmailRenderer.new(email: self).render
  end

end
