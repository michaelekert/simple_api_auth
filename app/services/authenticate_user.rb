class AuthenticateUser < ApplicationService
  def initialize(email,password)
    @email = email
    @password = password
  end
  private
  attr_accessor :email, :password

  def call
    user = User.find_by(email: email)
    return user if user&.authenticate(password)
    errors.add(:user_auth, 'Invalid credientials')
  end
end