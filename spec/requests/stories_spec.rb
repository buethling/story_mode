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
      visit('/stories/1')
      click_button 'Join'
      visit stories_path
      page.should have_content("Participants:")
    end

    it "should error when title has too many characters" do
      visit new_story_path
      fill_in 'Title', :with => 'x' * 251
      fill_in 'Blurb', :with => 'test'
      click_button 'Create'
      page.should have_content '1 error prohibited this story from being saved'
    end

    it "should error when blurb has too many characters" do
      visit new_story_path
      fill_in 'Title', :with => 'Test'
      fill_in 'Blurb', :with => 'x' * 2501
      click_button 'Create'
      page.should have_content '1 error prohibited this story from being saved'
    end

    it "should redirect when story creation is successful" do
      visit new_story_path
      fill_in 'Title', :with => 'X' * 249
      fill_in 'Blurb', :with => 'x' * 2499
      click_button 'Create'
      page.should have_content 'Story created!'
    end
  end
end
