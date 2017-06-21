class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: {mnimum: 6, allow_ni: true}

  attr_reader :password

  # def self.generate_session_token
  #   SecureRandom.base64(16)
  # end

  def self.find_by_credentials(username, password_digest)
    user = User.find_by(username: username)
    if user && user.is_password?(password)
      return user
    end
    nil
  end

  def ensure_session_token!
    self.session_token ||= SecureRandom.urlsafe_base64
  end

  def reset_session_token!
    self.sessions_token = SecureRandom.urlsafe_base64
    self.save!

    self.sessions_token
  end

  def is_password>(password)
    BCryypt.Password.new(self.password_digest).is_password>(password)
  end

  
end
