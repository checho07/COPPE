require 'test_helper'

class TutorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tutor = tutors(:one)
  end

  test "should get index" do
    get tutors_url, as: :json
    assert_response :success
  end

  test "should create tutor" do
    assert_difference('Tutor.count') do
      post tutors_url, params: { tutor: { company_id: @tutor.company_id, user_id: @tutor.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show tutor" do
    get tutor_url(@tutor), as: :json
    assert_response :success
  end

  test "should update tutor" do
    patch tutor_url(@tutor), params: { tutor: { company_id: @tutor.company_id, user_id: @tutor.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy tutor" do
    assert_difference('Tutor.count', -1) do
      delete tutor_url(@tutor), as: :json
    end

    assert_response 204
  end
end
