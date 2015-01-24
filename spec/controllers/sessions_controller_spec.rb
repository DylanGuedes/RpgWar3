require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do
  before do
    @user = FactoryGirl.create(:user)
  end

  let(:invalid_attributes){ FactoryGirl.attributes_for :user, email: " ", password: " " }
  let(:valid_attributes){ FactoryGirl.attributes_for :user, email: "novoemailtest@test.com", login: "umnovonome" }

  describe "GET " do
    describe "#new" do
      it "should return success" do
        get :new
        expect(response).to have_http_status(:success)
      end
    end
  end

end
