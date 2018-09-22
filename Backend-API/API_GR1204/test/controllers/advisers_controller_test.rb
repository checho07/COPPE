require 'test_helper'

class AdvisersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @adviser = advisers(:one)
  end

  test "should get index" do
    get advisers_url, as: :json
    assert_response :success
  end

  test "should create adviser" do
    assert_difference('Adviser.count') do
      post advisers_url, params: { adviser: { area_id: @adviser.area_id, user_id: @adviser.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show adviser" do
    get adviser_url(@adviser), as: :json
    assert_response :success
  end

  test "should update adviser" do
    patch adviser_url(@adviser), params: { adviser: { area_id: @adviser.area_id, user_id: @adviser.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy adviser" do
    assert_difference('Adviser.count', -1) do
      delete adviser_url(@adviser), as: :json
    end

    assert_response 204
  end
end
