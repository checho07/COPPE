require 'test_helper'

class EntrepreneursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entrepreneur = entrepreneurs(:one)
  end

  test "should get index" do
    get entrepreneurs_url, as: :json
    assert_response :success
  end

  test "should create entrepreneur" do
    assert_difference('Entrepreneur.count') do
      post entrepreneurs_url, params: { entrepreneur: { neighborhood_id: @entrepreneur.neighborhood_id, user_id: @entrepreneur.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show entrepreneur" do
    get entrepreneur_url(@entrepreneur), as: :json
    assert_response :success
  end

  test "should update entrepreneur" do
    patch entrepreneur_url(@entrepreneur), params: { entrepreneur: { neighborhood_id: @entrepreneur.neighborhood_id, user_id: @entrepreneur.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy entrepreneur" do
    assert_difference('Entrepreneur.count', -1) do
      delete entrepreneur_url(@entrepreneur), as: :json
    end

    assert_response 204
  end
end
