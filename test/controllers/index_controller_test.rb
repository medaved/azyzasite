require 'test_helper'

class IndexControllerTest < ActionDispatch::IntegrationTest
  test "should get blog" do
    get index_blog_url
    assert_response :success
  end

end
