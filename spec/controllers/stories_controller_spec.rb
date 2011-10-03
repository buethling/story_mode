require 'spec_helper'

describe StoriesController do
  context "for a non-logged in user" do
    before do
      get :show, :id => 1
    end

    it { should redirect_to(signin_path) }
  end
  context "for logged in user" do
    before do
      @user = Factory(:user)
      @story = Factory(:story)
    end
  end
end
