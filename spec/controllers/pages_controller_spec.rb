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
      
      before(:each) do
        @admin = Factory(:user, :name => "Admin User", :admin => true)
        controller.current_user = @admin
      end
      
      it "should be successful" do
        get 'admin'
        response.should be_success
      end
      
      let(:stories) { 2.times.map { Factory.create :story } }
      it "should get all of them" do
        get 'admin'
        assigns(:stories).should eq(stories) 
      end
      
    end
    
    context "for non-admin users" do
      
      it "should redirect to root_path if logged in but non-admin" do
        @user = Factory(:user)
        controller.current_user = @user
        get 'admin'
        response.should redirect_to root_path
      end
      
      it "should redirect to root_path if not logged in" do
        get 'admin'
        response.should redirect_to root_path
      end
      
    end
  end

end