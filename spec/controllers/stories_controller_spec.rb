require 'spec_helper'

describe StoriesController do
  it "should redirect to signin_path if not logged in" do
    get "/stories/1"
    response.should redirect_to signin_path
  end
end
