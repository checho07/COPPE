require 'test_helper'

class AdvisoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @advisory = advisories(:one)
  end

  test "should get index" do
    get advisories_url, as: :json
    assert_response :success
  end

  test "should create advisory" do
    assert_difference('Advisory.count') do
      post advisories_url, params: { advisory: { adviser_id: @advisory.adviser_id, project_id: @advisory.project_id, type_advisory: @advisory.type_advisory } }, as: :json
    end

    assert_response 201
  end

  test "should show advisory" do
    get advisory_url(@advisory), as: :json
    assert_response :success
  end

  test "should update advisory" do
    patch advisory_url(@advisory), params: { advisory: { adviser_id: @advisory.adviser_id, project_id: @advisory.project_id, type_advisory: @advisory.type_advisory } }, as: :json
    assert_response 200
  end

  test "should destroy advisory" do
    assert_difference('Advisory.count', -1) do
      delete advisory_url(@advisory), as: :json
    end

    assert_response 204
  end
end
