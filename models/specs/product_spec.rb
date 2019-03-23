require('minitest/autorun')
require('minitest/rg')
require_relative('../product.rb')
require_relative('../manufacturer.rb')
require_relative('../category.rb')

class TestProduct < MiniTest::Test

  def setup()
    @manufacturer1 = Manufacturer.new({
      "id" => 1,
      "name" => "John Morrison Kilt",
      "country" => "UK",
      "phone" => "0131 556 473",
      "email" => "info@johnmorrisonkilt.com"
      })

    options = {
      "name" => "kilt",
      "description" => "8 yards polyester kilt",
      "stock_quantity" => 20,
      "buying_cost" => 23.99,
      "selling_price" => 49.99,
      "order_date" => "2019-03-11",
      "manufacturer_id" => 1,
      "category_id" => 1
    }

    @product1 = Product.new(options)

  end

  def test_product_name()
    assert_equal("kilt", @product1.name())
  end

  def test_product_description()
    assert_equal("8 yards polyester kilt", @product1.description())
  end

  def test_product_stock_quantiry()
    assert_equal(20, @product1.stock_quantity())
  end

  def test_product_buying_cost()
    assert_equal(23.99, @product1.buying_cost())
  end

  def test_product_selling_price()
    assert_equal(49.99, @product1.selling_price())
  end

  def test_product_order_date()
    assert_equal("2019-03-11", @product1.order_date())
  end

  def test_product_manufacturer_id()
    result = @manufacturer1.id
    assert_equal(result, @product1.manufacturer_id)
  end

  def test_product_category_id()
    assert_equal(1, @product1.category_id())
  end

  def test_manufacturer_name_of_a_product()
    result = @manufacturer1.key(name)
    assert_equal(result, @product1.manufacturer())
  end

end
