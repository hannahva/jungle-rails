class User < ActiveRecord::Base

  def self.authenticate_with_credentials(email, password)

  end

  has_secure_password
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, :first_name, :last_name, presence: true
  validates :password, presence: true, length: { minimum: 3 }
  validates :password_confirmation, presence: true

end
