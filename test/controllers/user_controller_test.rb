require 'test_helper'

class UserControllerTest < ActionController::TestCase
  test "should get create_fetcher" do
    get :create_fetcher
    assert_response :success
  end

end
