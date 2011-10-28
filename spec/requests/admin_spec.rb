require 'spec_helper'

describe "Admin" do
  context "for logged in admin users" do
    before(:each) do
      @admin = Factory(:user, :name => "Admin User", :admin => true)
      @story = Factory(:story)
      
      visit signin_path
      fill_in 'Email', :with => 'test@test.com'
      fill_in 'Password', :with => 'testicles'
      click_button 'Sign in'
    end

    it "should show 'Logged in as Admin User'" do
      page.should have_content("Logged in as Admin User")
    end
    
    it "should show 'Admin' link" do
      page.should have_link("Admin")
    end
    
    it "should go to Pages#admin" do
      click_link("Admin")
      page.should have_content("Administration")
    end

    it "should have a link to User#edit for current user" do
      @user = Factory.create(:user, :email => "test1@test.com")
      click_link("Admin")
      page.should have_link(@user.name, :href => edit_user_path(@user))
    end
  end
  context "for logged in non-admin users" do
    before(:each) do
      @user  = Factory(:user)
      @story = Factory(:story)
      
      visit signin_path
      fill_in 'Email', :with => 'test@test.com'
      fill_in 'Password', :with => 'testicles'
      click_button 'Sign in'
    end
    
    it "should show 'Admin' link" do
      page.should_not have_link("Admin")
    end
  end
end
