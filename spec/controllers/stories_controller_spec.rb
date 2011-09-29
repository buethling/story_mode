require 'spec_helper'

describe StoriesController do
  it "should redirect to signin_path if not logged in" do
    get :show
    assert_redirected_to signin_path
  end
end
