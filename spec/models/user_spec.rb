require 'rails_helper'

RSpec.describe User, :type => :model do
  before do
    @user = FactoryGirl.create(:user)
  end

  subject { @user }
  it { should respond_to(:email) }
  it { should respond_to(:login) }
  it { should respond_to(:name) }
end
