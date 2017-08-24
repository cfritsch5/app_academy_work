class User < ActiveRecord::Base

  #class User
  #validations
  #ensure session token
  #attr_reader :password
  #self.find_by_credentials
  #password= and valid_password
  #reset_token
  #ensure token

  validates :username, :password_digest, presence: true
  validates :password, length: {minimum: 6, allow_nil: true}

  after_initialize :ensure_session_token

  has_many :links
  has_many :comments

  attr_reader :password

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil unless user && user.valid_password?(password)
    user
  end

  def password=(password)
    #overwriting the password setter method
    #will this be called by the active record initialize?
    #when is this called? it must be called when either
    #initializing or saving
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def valid_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.session_token
  end

  private

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end
end
