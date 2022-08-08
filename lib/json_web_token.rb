class JsonWebToken

  SECRET = Rails.application.credentials.secret_key_base
  ENCRYPTION = 'none'

  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp
    JWT.encode(payload, SECRET, ENCRYPTION)
  end

  def self.decode(token)
    body = JWT.decode(token, SECRET)
    HashWithIndifferentAccess.new(body)
  rescue JWT::ExpiredSignature
    nil
  rescue
    nil
  end

end
