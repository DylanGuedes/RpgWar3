require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  before do
    @user = FactoryGirl.create(:user)
  end

  let(:invalid_attributes){ FactoryGirl.attributes_for :user, email: " ", password: " " }

  describe "GET" do
    describe "#new" do
      it "should return success" do
        get :new
        expect(response).to have_http_status(:success)
      end
    end
    describe "#show" do
      it "should return success" do
        get :show, id: @user.id
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "POST" do
    describe "#create" do
      context "with valid params" do
        subject { post :create, user: @user }

        it "should increase total number of users" do
          expect { subject }.to change(User, :count).by(1)
        end
      end
      context "with invalid params" do
        subject { post :create, user: invalid_attributes }
        it "should not increase total number of users" do
          expect { subject }.not_to change(User, :count )
        end

        it "re-render the page" do
          subject
          response.should render_template 'new'
        end
      end
    end
  end
end
