require 'spec_helper'

describe "Stories" do
  context "for logged in users" do
    before(:each) do
      @user = Factory(:user)
      @story = Factory(:story)
      
      visit signin_path
      fill_in 'Email', :with => 'test@test.com'
      fill_in 'Password', :with => 'testicles'
      click_button 'Sign in'
    end

    it "should show 'Participants: Mike Hoxhuge'" do
      visit('/stories/1')
      page.should have_button 'Join'
      click_button 'Join'
      page.should have_content("Participants: Mike Hoxhuge")
    end
    
    it "should show 'Participants:'" do
      visit stories_path
      page.should have_content("Participants:")
    end
  end
end
