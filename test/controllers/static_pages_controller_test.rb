require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "e-Navigator"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "Help | e-Navigator"
  end

end
