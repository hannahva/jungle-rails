require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      @user = User.new(first_name: "first-name",
                       last_name: "last-name",
                       email: "test@test.come",
                       password: "password",
                       password_confirmation: "password"
                       )
      expect(@user).to be_valid
    end
    it 'is not valid without first_name' do
      @user = User.new(first_name: nil,
                       last_name: "last-name",
                       email: "test@test.come",
                       password: "password",
                       password_confirmation: "password"
                       )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to eql ["First name can't be blank"]
    end
    it 'is not valid without last_name' do
      @user = User.new(first_name: "first-name",
                       last_name: nil,
                       email: "test@test.come",
                       password: "password",
                       password_confirmation: "password"
                       )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to eql ["Last name can't be blank"]
    end
    it 'is not valid without email' do
      @user = User.new(first_name: "first-name",
                       last_name: "last-name",
                       email: nil,
                       password: "password",
                       password_confirmation: "password"
                       )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to eql ["Email can't be blank"]
    end
    it 'is not valid without password' do
      @user = User.new(first_name: "first-name",
                       last_name: "last-name",
                       email: "test@test.com",
                       password: nil,
                       password_confirmation: "password"
                       )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to eql ["Password can't be blank", "Password can't be blank", "Password is too short (minimum is 3 characters)"]
    end
    it 'is not valid with a password shorter than 3 characters' do
      @user = User.new(first_name: "first-name",
                       last_name: "last-name",
                       email: "test@test.com",
                       password: "hi",
                       password_confirmation: "hi"
                       )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to eql ["Password is too short (minimum is 3 characters)"]
    end
    it 'is not valid without password_confirmation' do
      @user = User.new(first_name: "first-name",
                       last_name: "last-name",
                       email: "test@test.com",
                       password: "password",
                       password_confirmation: nil
                       )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to eql ["Password confirmation can't be blank"]
    end
    it 'is not valid if password and password_confirmation do not match' do
      @user = User.new(first_name: "first-name",
                       last_name: "last-name",
                       email: "test@test.com",
                       password: "password",
                       password_confirmation: "wordpass"
                       )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to eql ["Password confirmation doesn't match Password"]
    end
    it 'is not valid if email is not unique' do
      User.create!(first_name: "first-name",
                   last_name: "last-name",
                   email: "TEST1@test.com",
                   password: "password",
                   password_confirmation: "password"
                   )
      @user = User.new(first_name: "first-name",
                       last_name: "last-name",
                       email: "test1@test.com",
                       password: "password",
                       password_confirmation: "password"
                       )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to eql ["Email has already been taken"]
    end
  end
  describe '.authenticate_with_credentials' do
    User.find_by_email("teSt2@tEst.com").destroy
    User.create!(first_name: "first-name",
                   last_name: "last-name",
                   email: "teSt2@tEst.com",
                   password: "password",
                   password_confirmation: "password"
                   )
    it 'should authenticate if passed valid fields'do
      @user = User.find_by_email("teSt2@tEst.com")
      expect(User.authenticate_with_credentials("teSt2@tEst.com", "password")).to eql @user
      expect(User.authenticate_with_credentials("   teSt2@tEst.com", "password")).to eql @user
      expect(User.authenticate_with_credentials("TESt2@test.COM", "password")).to eql @user
    end
    it 'should not authenticate if passed in invalid email' do
      expect(User.authenticate_with_credentials("wrong@test.com", "password")).to eql nil
    end
    it 'should not authenticate if passed invalid password' do
      expect(User.authenticate_with_credentials("test2@test.com", "wordpass")).to eql nil
    end
  end
end
