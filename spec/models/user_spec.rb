require 'rails_helper'

include SessionsHelper

RSpec.describe User, :type => :model do
  before do
    @user = FactoryGirl.create(:user)
  end

  subject { @user }
  it { should respond_to(:email) }
  it { should respond_to(:login) }
  it { should respond_to(:name) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:password_digest ) }

  describe "user" do
    it "#digest should be kind of bcrypt_password" do
      action = User.digest(@user.password)
      expect(action).to be_kind_of(BCrypt::Password)
    end
    it "#new_token should return a new crypted pass" do
      action = User.new_token
      expect(action).to be_kind_of(String)
    end
    describe "authenticated?" do
      it "should return nil with an unlogged user" do
        action = @user.authenticated?(@user.remember_token)
        expect(action).to eq(false)
      end
    end
    it "#forget should make remember_digest nil" do
      @user.remember_digest = "123456"
      action = @user.forget
      expect(@user.remember_digest).to eq(nil)
    end
  end
end
