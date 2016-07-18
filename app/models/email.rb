class Email < ActiveRecord::Base
  belongs_to :template
  validates :template, presence: true

  validates_inclusion_of :is_archived, in: [true, false]

  before_create do
    self.token = SecureRandom.urlsafe_base64(30)
  end

  after_initialize do
    if self.new_record?
      self.is_archived = false
    end
  end

  scope :archived,     -> { where(is_archived: true)  }
  scope :not_archived, -> { where(is_archived: false) }

  def render
    EmailRenderer.new(email: self).render
  end

  def is_archived?
  	self.is_archived == true
  end

end
