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
      post advisers_url, params: { adviser: { age_adviser: @adviser.age_adviser, area_id: @adviser.area_id, cc_adviser: @adviser.cc_adviser, email_adviser: @adviser.email_adviser, experience: @adviser.experience, lastname_adviser: @adviser.lastname_adviser, name_adviser: @adviser.name_adviser, phone_adviser: @adviser.phone_adviser } }, as: :json
    end

    assert_response 201
  end

  test "should show adviser" do
    get adviser_url(@adviser), as: :json
    assert_response :success
  end

  test "should update adviser" do
    patch adviser_url(@adviser), params: { adviser: { age_adviser: @adviser.age_adviser, area_id: @adviser.area_id, cc_adviser: @adviser.cc_adviser, email_adviser: @adviser.email_adviser, experience: @adviser.experience, lastname_adviser: @adviser.lastname_adviser, name_adviser: @adviser.name_adviser, phone_adviser: @adviser.phone_adviser } }, as: :json
    assert_response 200
  end

  test "should destroy adviser" do
    assert_difference('Adviser.count', -1) do
      delete adviser_url(@adviser), as: :json
    end

    assert_response 204
  end
end
