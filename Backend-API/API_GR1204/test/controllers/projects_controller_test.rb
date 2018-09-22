require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:one)
  end

  test "should get index" do
    get projects_url, as: :json
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post projects_url, params: { project: { area_id: @project.area_id, creationDate_project: @project.creationDate_project, entrepreneur_id: @project.entrepreneur_id, finalDate_project: @project.finalDate_project, name_project: @project.name_project, numMembers__project: @project.numMembers__project, progress_project: @project.progress_project, tutor_id: @project.tutor_id } }, as: :json
    end

    assert_response 201
  end

  test "should show project" do
    get project_url(@project), as: :json
    assert_response :success
  end

  test "should update project" do
    patch project_url(@project), params: { project: { area_id: @project.area_id, creationDate_project: @project.creationDate_project, entrepreneur_id: @project.entrepreneur_id, finalDate_project: @project.finalDate_project, name_project: @project.name_project, numMembers__project: @project.numMembers__project, progress_project: @project.progress_project, tutor_id: @project.tutor_id } }, as: :json
    assert_response 200
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete project_url(@project), as: :json
    end

    assert_response 204
  end
end
