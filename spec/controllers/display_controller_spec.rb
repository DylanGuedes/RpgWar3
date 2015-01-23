require 'rails_helper'

RSpec.describe DisplayController, :type => :controller do
  describe "GET method" do
    subject { expect(response).to have_http_status(:success) }
    describe ":index" do
      it "should return success" do
        get :index
        subject
      end
    end
    describe ":help" do
      it "should return success" do
        get :help
        subject
      end
    end
    describe ":about" do
      it "should return success" do
        get :about
        subject
      end
    end
  end
end
