require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @valid_user_attributes = { email: "panthercookie@gamil.com", first_name: "John", last_name: "Doe", address: "123 Main St" }
    @invalid_user_attributes = { email: "", first_name: "Invalid", last_name: "User", address: "123 Main St" }
  end

  test "get new user page" do
    get new_user_path
    assert_template :new
  end

  test "create user succeeded" do
    post users_path, params: { user: @valid_user_attributes }

    assert_redirected_to users_path
    assert_equal "Welcome to fandnext", flash[:success]
  end

  test "create user failed" do
    post users_path, params: { user: @invalid_user_attributes }

    assert_template :new
    assert_equal "User create failed", flash[:warning]
  end
end
