class AuthorizeApiRequest < ApplicationService
  attr_reader :headers
  def initialize(headers = {})
    @headers = headers
  end

  def call
    user
  end
end
