require 'test_helper'

class CompaniesCitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @companies_city = companies_cities(:one)
  end

  test "should get index" do
    get companies_cities_url, as: :json
    assert_response :success
  end

  test "should create companies_city" do
    assert_difference('CompaniesCity.count') do
      post companies_cities_url, params: { companies_city: { city_id: @companies_city.city_id, company_id: @companies_city.company_id } }, as: :json
    end

    assert_response 201
  end

  test "should show companies_city" do
    get companies_city_url(@companies_city), as: :json
    assert_response :success
  end

  test "should update companies_city" do
    patch companies_city_url(@companies_city), params: { companies_city: { city_id: @companies_city.city_id, company_id: @companies_city.company_id } }, as: :json
    assert_response 200
  end

  test "should destroy companies_city" do
    assert_difference('CompaniesCity.count', -1) do
      delete companies_city_url(@companies_city), as: :json
    end

    assert_response 204
  end
end
