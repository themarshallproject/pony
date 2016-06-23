class TokenAuthentication

  def self.tokens
    ENV['TOKENS'].to_s.split(',')
  end

  def self.no_tokens_defined?
    self.tokens.count == 0
  end

  def self.valid?(token)
    return false if token.blank?
    return false if self.no_tokens_defined?

    return self.tokens.include?(token)
  end

end
