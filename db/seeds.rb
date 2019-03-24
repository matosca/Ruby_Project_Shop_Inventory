require('pry-byebug')
require_relative('../models/product.rb')
require_relative('../models/manufacturer.rb')
require_relative('../models/category.rb')

Product.delete_all
Manufacturer.delete_all
Category.delete_all

manufacturer1 = Manufacturer.new({
  "name" => "John Morrison Kilt",
  "country" => "UK",
  "phone" => "0131 556 473",
  "email" => "info@johnmorrisonkilt.com"
  })
manufacturer1.save()

manufacturer2 = Manufacturer.new({
  "name" => "Aran Tradition",
  "country" => "Ireland",
  "phone" => "0121 006 885",
  "email" => "info@arantradition.com"
  })
manufacturer2.save()

manufacturer3 = Manufacturer.new({
  "name" => "Walkers Ltd",
  "country" => "UK",
  "phone" => "0131 871 555",
  "email" => "www.walkersshortbread.com"
  })
manufacturer3.save()

manufacturer4 = Manufacturer.new({
  "name" => "Safon",
  "country" => "Spain",
  "phone" => "0034 972 26 83 04",
  "email" => "info@safon.com"
  })
manufacturer4.save()

category1 = Category.new({
  "type" => "Highlandwear"
  })
category1.save()

category2 = Category.new({
  "type" => "Confectionary"
  })
category2.save()

category3 = Category.new({
  "type" => "Winter Clothing"
  })
category3.save()

category4 = Category.new({
  "type" => "Summer Clothing"
  })
category4.save()

product1 = Product.new({
  "name" => "Kilt",
  "description" => "8 yards polyester kilt",
  "stock_quantity" => 20,
  "buying_cost" => 24.90,
  "selling_price" => 49.99,
  "manufacturer_id" => manufacturer1.id,
  "category_id" => category1.id
  })
product1.save()

product2 = Product.new({
  "name" => "Hat",
  "description" => "Winter woollen pom-pom hat",
  "stock_quantity" => 60,
  "buying_cost" => 6.99,
  "selling_price" => 15.99,
  "manufacturer_id" => manufacturer2.id,
  "category_id" => category3.id
  })
product2.save()

product3 = Product.new({
  "name" => "Shortbread",
  "description" => "Traditional butter biscuits",
  "stock_quantity" => 250,
  "buying_cost" => 0.69,
  "selling_price" => 3.99,
  "manufacturer_id" => manufacturer3.id,
  "category_id" => category2.id
  })
product3.save()

product4 = Product.new({
  "name" => "T-shirt",
  "description" => "Short sleeves cotton t-shirt",
  "stock_quantity" => 10,
  "buying_cost" => 2.99,
  "selling_price" => 9.99,
  "manufacturer_id" => manufacturer4.id,
  "category_id" => category4.id
  })
product4.save()




binding.pry
nil
