class RegistrationUser  < ApplicationService
  def initialize(email,password)
    @email = email
    @password = password

  end

  attr_accessor :email, :password

  def call
    if uniq_credential == nil
    User.create(
      email: email,
      password: password
    )
    else
    errors.add(:registration_error, 'Invalid email or passsword')
    end
    end

  private

  def uniq_credential
    @uniq_credential = User.find_by(email: email)
  end

end
