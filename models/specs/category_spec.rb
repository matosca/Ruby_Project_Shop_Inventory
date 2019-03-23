require('minitest/autorun')
require('minitest/rg')
require_relative('./category.rb')

class TestCategory < MiniTest::Test

  def setup()
    options = { "id" => 1, "type" => "Highlandwear"}

    @category1 = Category.new(options)
  end

  def test_category_type()
    assert_equal("Highlandwear", @category1.type())
  end

end
