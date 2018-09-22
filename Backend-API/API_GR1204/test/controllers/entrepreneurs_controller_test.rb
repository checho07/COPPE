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
      post entrepreneurs_url, params: { entrepreneur: { address_entre: @entrepreneur.address_entre, age_entre_int: @entrepreneur.age_entre_int, cc_entre: @entrepreneur.cc_entre, email_entre: @entrepreneur.email_entre, lastname_entre: @entrepreneur.lastname_entre, name_entre: @entrepreneur.name_entre, neighborhood_id: @entrepreneur.neighborhood_id, phone_entre: @entrepreneur.phone_entre } }, as: :json
    end

    assert_response 201
  end

  test "should show entrepreneur" do
    get entrepreneur_url(@entrepreneur), as: :json
    assert_response :success
  end

  test "should update entrepreneur" do
    patch entrepreneur_url(@entrepreneur), params: { entrepreneur: { address_entre: @entrepreneur.address_entre, age_entre_int: @entrepreneur.age_entre_int, cc_entre: @entrepreneur.cc_entre, email_entre: @entrepreneur.email_entre, lastname_entre: @entrepreneur.lastname_entre, name_entre: @entrepreneur.name_entre, neighborhood_id: @entrepreneur.neighborhood_id, phone_entre: @entrepreneur.phone_entre } }, as: :json
    assert_response 200
  end

  test "should destroy entrepreneur" do
    assert_difference('Entrepreneur.count', -1) do
      delete entrepreneur_url(@entrepreneur), as: :json
    end

    assert_response 204
  end
end
