class User < ActiveRecord::Base

  has_secure_password

  validates :email, uniqueness: { case_sensitive: false }
  validates :email, :first_name, :last_name, presence: true
  validates :password, presence: true, length: { minimum: 3 }
  validates :password_confirmation, presence: true

  def authenticate_with_credentials(email, password)
    @user = User.find_by_email(email)
    if @user.authenticate(password)
      @user
    else
      nil
    end
  end
end
