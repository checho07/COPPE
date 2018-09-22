require 'test_helper'

class CoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course = courses(:one)
  end

  test "should get index" do
    get courses_url, as: :json
    assert_response :success
  end

  test "should create course" do
    assert_difference('Course.count') do
      post courses_url, params: { course: { area_id: @course.area_id, course_type_id: @course.course_type_id, date_cour: @course.date_cour, duration_cour: @course.duration_cour, link_cour: @course.link_cour, name_cour: @course.name_cour, teacher_cour: @course.teacher_cour } }, as: :json
    end

    assert_response 201
  end

  test "should show course" do
    get course_url(@course), as: :json
    assert_response :success
  end

  test "should update course" do
    patch course_url(@course), params: { course: { area_id: @course.area_id, course_type_id: @course.course_type_id, date_cour: @course.date_cour, duration_cour: @course.duration_cour, link_cour: @course.link_cour, name_cour: @course.name_cour, teacher_cour: @course.teacher_cour } }, as: :json
    assert_response 200
  end

  test "should destroy course" do
    assert_difference('Course.count', -1) do
      delete course_url(@course), as: :json
    end

    assert_response 204
  end
end
