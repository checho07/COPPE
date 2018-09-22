require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url, as: :json
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { age_user: @user.age_user, cc_user: @user.cc_user, email_user: @user.email_user, experience_user: @user.experience_user, lastname_user: @user.lastname_user, name_user: @user.name_user, password_digest: @user.password_digest, phone_user: @user.phone_user, role_id: @user.role_id, username: @user.username } }, as: :json
    end

    assert_response 201
  end

  test "should show user" do
    get user_url(@user), as: :json
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { age_user: @user.age_user, cc_user: @user.cc_user, email_user: @user.email_user, experience_user: @user.experience_user, lastname_user: @user.lastname_user, name_user: @user.name_user, password_digest: @user.password_digest, phone_user: @user.phone_user, role_id: @user.role_id, username: @user.username } }, as: :json
    assert_response 200
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user), as: :json
    end

    assert_response 204
  end
end
