require_relative('../models/manufacturer.rb')
require_relative('../models/category.rb')
require_relative('../models/product.rb')

manufacturer1 = Manufacturer.new({
  "name" => "John Morrison Kilt",
  "country" => "UK",
  "phone" => "0131 556 4783",
  "email" => "info@johnmorrisonkilt.com"
  })
