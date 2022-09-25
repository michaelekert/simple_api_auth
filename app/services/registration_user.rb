class RegistrationUser  < ApplicationService

  def initialize(email,password)
    @email = email
    @password = password

  end

  attr_accessor :email, :password

  def call
    if uniq_credential != nil
      errors.add(:registration_error, "Email probably is already taken")
    elsif email.blank? || password.blank? || valid_email == false
      errors.add(:invalid_credentials, "Ivalid credentials")
    else
      User.create(
        email: email,
        password: password
      )
    end
  end

  private

  def valid_email
    URI::MailTo::EMAIL_REGEXP.match?(email)
  end

  def uniq_credential
    @uniq_credential = User.find_by(email: email)
  end
end
