require 'spec_helper'

describe PagesController do

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
  end

  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end
  end
  
  describe "GET 'admin'" do
    context "for admin users" do
      
      before do
        @stories = 2.times.map { Factory.create :story }
      end

      it "should get all stories" do
        @admin = Factory.create(:user, :name => "Admin", :email => "admin@test.com", :admin => true)
        test_sign_in(@admin)
        get 'admin'
        @stories.map { |story| assigns(:stories).should include(story) }
      end
      
    end
    
    context "for non-admin users" do
      
      it "should redirect to root_path if logged in but non-admin" do
        @user = Factory.create(:user)
        test_sign_in(@user)
        get 'admin'
        response.should redirect_to root_path
      end
      
    end
  end

end
