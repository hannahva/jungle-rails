class User < ActiveRecord::Base

  has_secure_password

  def self.authenticate_with_credentials(email, password)
    @email = email
    @password = password
    @user = User.find_by(@email)
    if @user.authenticate(@password)
      @user
    else
      nil
    end
  end

  validates :email, uniqueness: { case_sensitive: false }
  validates :email, :first_name, :last_name, presence: true
  validates :password, presence: true, length: { minimum: 3 }
  validates :password_confirmation, presence: true

end
