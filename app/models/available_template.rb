class AvailableTemplate
  def self.all
    Template.order('title ASC').all || []
  end
end
