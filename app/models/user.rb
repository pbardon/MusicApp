class User < ActiveRecord::Base
  attr_reader :password
  validates :email, :password_digest, :session_token, presence: true
  validates :email, uniqueness: true

  before_validation :ensure_session_token

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def is_password?(password)
    bcrypt_o = Bcrypt::Password.new(self.password_digest)
    bcrypt_o.is_password?(password)
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
    self.save!
  end

  def self.find_by_credentials(email, password)
    u = User.find_by_email(email)
    if u.is_password?(password)
      return u
    else
      nil
    end
  end

  def self.generate_session_token
    SecureRandom.urlsafe_base64
  end

  def reset_session_token
    self.session_token = User.generate_session_token
    self.save!
  end
  
end
