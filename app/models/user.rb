class User < ActiveRecord::Base
  before_create :create_remember_token

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :username, :presence => true, :uniqueness => { :case_sensitive => false}
  validates :emailID, :presence => true, :uniqueness => { :case_sensitive => false}, :format => { :with => VALID_EMAIL_REGEX }

  validates :password, :length => { :minimum => 6 }

  def has_password?(submitted_password)
    password == submitted_password
  end

  def User.authenticate(username, submitted_password)
    user = find_by_username(username)
    return nil if user.nil?
    return user if user.has_password?(submitted_password)
  end

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end
end
