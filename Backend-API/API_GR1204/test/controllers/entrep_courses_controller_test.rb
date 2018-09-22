require 'test_helper'

class EntrepCoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entrep_course = entrep_courses(:one)
  end

  test "should get index" do
    get entrep_courses_url, as: :json
    assert_response :success
  end

  test "should create entrep_course" do
    assert_difference('EntrepCourse.count') do
      post entrep_courses_url, params: { entrep_course: { course_id: @entrep_course.course_id, entrepreneur_id: @entrep_course.entrepreneur_id } }, as: :json
    end

    assert_response 201
  end

  test "should show entrep_course" do
    get entrep_course_url(@entrep_course), as: :json
    assert_response :success
  end

  test "should update entrep_course" do
    patch entrep_course_url(@entrep_course), params: { entrep_course: { course_id: @entrep_course.course_id, entrepreneur_id: @entrep_course.entrepreneur_id } }, as: :json
    assert_response 200
  end

  test "should destroy entrep_course" do
    assert_difference('EntrepCourse.count', -1) do
      delete entrep_course_url(@entrep_course), as: :json
    end

    assert_response 204
  end
end
