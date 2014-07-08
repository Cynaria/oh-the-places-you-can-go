module Tokenable
  extend ActiveSupport::Concern

  included do
    before_create :generate_key
  end

  protected

  def generate_key
    self.url_key = loop do
      random_token = SecureRandom.urlsafe_base64(6, false)
      break random_token unless self.class.exists?(url_key: random_token)
    end
  end
end