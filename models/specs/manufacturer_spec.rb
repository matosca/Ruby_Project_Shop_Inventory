require('minitest/rg')
require('minitest/autorun')
require_relative('../manufacturer.rb')

class TestManufacturer < MiniTest::Test

  def setup()
    options = {
      "name" => "John Morrison Kilt",
      "country" => "UK",
      "phone" => "0131 556 473",
      "email" => "info@johnmorrisonkilt.com"
    }

    @manufacturer1 = Manufacturer.new(options)
  end

  def test_manufacturer_name()
    assert_equal("John Morrison Kilt", @manufacturer1.name())
  end

  def test_manufacturer_country()
    assert_equal("UK", @manufacturer1.country())
  end

  def test_manufacturer_phone_number()
    assert_equal("0131 556 473", @manufacturer1.phone())
  end

  def test_manufacturer_email_address()
    assert_equal("info@johnmorrisonkilt.com", @manufacturer1.email())
  end

end
