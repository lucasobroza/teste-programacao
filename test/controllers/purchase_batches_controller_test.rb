require 'test_helper'

class PurchaseBatchesControllerTest < ActionDispatch::IntegrationTest
  test "should get new," do
    get purchase_batches_new,_url
    assert_response :success
  end

  test "should get index" do
    get purchase_batches_index_url
    assert_response :success
  end

end
