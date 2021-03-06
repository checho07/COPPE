require 'test_helper'

class DocumentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @document = documents(:one)
  end

  test "should get index" do
    get documents_url, as: :json
    assert_response :success
  end

  test "should create document" do
    assert_difference('Document.count') do
      post documents_url, params: { document: { creationDate_doc: @document.creationDate_doc, file_type_id: @document.file_type_id, name_doc: @document.name_doc, project_id: @document.project_id } }, as: :json
    end

    assert_response 201
  end

  test "should show document" do
    get document_url(@document), as: :json
    assert_response :success
  end

  test "should update document" do
    patch document_url(@document), params: { document: { creationDate_doc: @document.creationDate_doc, file_type_id: @document.file_type_id, name_doc: @document.name_doc, project_id: @document.project_id } }, as: :json
    assert_response 200
  end

  test "should destroy document" do
    assert_difference('Document.count', -1) do
      delete document_url(@document), as: :json
    end

    assert_response 204
  end
end
