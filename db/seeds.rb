require_relative('../models/product.rb')
require_relative('../models/manufacturer.rb')
require_relative('../models/category.rb')

Product.delete_all
Manufacturer.delete_all
Category.delete_all

manufacturer1 = Manufacturer.new({
  "name" => "John Morrison Kiltmakers",
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
  "name" => "Walkers LTD",
  "country" => "UK",
  "phone" => "0131 871 555",
  "email" => "info@walkersshortbread.com"
  })
manufacturer3.save()

manufacturer4 = Manufacturer.new({
  "name" => "Safon",
  "country" => "Spain",
  "phone" => "0034 972 26 83 04",
  "email" => "info@safon.com"
  })
manufacturer4.save()

manufacturer5 = Manufacturer.new({
  "name" => "Elgate",
  "country" => "UK",
  "phone" => "0131 268 304",
  "email" => "info@elgate.com"
  })
manufacturer5.save()

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

category5 = Category.new({
  "type" => "Lambswool, Cashmere & Wool"
  })
category5.save()

category6 = Category.new({
  "type" => "Jewellery"
  })
category6.save()

category7 = Category.new({
  "type" => "Sweaters, Jackets & Hoodied Tops"
  })
category7.save()

category8 = Category.new({
  "type" => "Small Gift & Soft Toys"
  })
category8.save()


product1 = Product.new({
  "name" => "Kilt",
  "description" => "8 Yards Polyester Kilt",
  "stock_quantity" => 20,
  "max_quantity" => 25,
  "min_quantity" => 5,
  "buying_cost" => 24.90,
  "selling_price" => 49.99,
  "manufacturer_id" => manufacturer1.id,
  "category_id" => category1.id
  })
product1.save()

product2 = Product.new({
  "name" => "Woollen Hat",
  "description" => "Winter Woollen Pom-Pom Hat",
  "stock_quantity" => 60,
  "max_quantity" => 60,
  "min_quantity" => 10,
  "buying_cost" => 6.99,
  "selling_price" => 15.99,
  "manufacturer_id" => manufacturer2.id,
  "category_id" => category3.id
  })
product2.save()

product3 = Product.new({
  "name" => "Finger Shortbread",
  "description" => "Traditional Butter Finger Shortbread",
  "stock_quantity" => 250,
  "max_quantity" => 300,
  "min_quantity" => 100,
  "buying_cost" => 0.69,
  "selling_price" => 3.99,
  "manufacturer_id" => manufacturer3.id,
  "category_id" => category2.id
  })
product3.save()

product4 = Product.new({
  "name" => "Nessie T-Shirt",
  "description" => "Short Sleeves 100% Cotton T-Shirt",
  "stock_quantity" => 10,
  "max_quantity" => 30,
  "min_quantity" => 10,
  "buying_cost" => 2.99,
  "selling_price" => 9.99,
  "manufacturer_id" => manufacturer4.id,
  "category_id" => category4.id
  })
product4.save()

product5 = Product.new({
  "name" => "Sporran",
  "description" => "Basic Leather Sporran",
  "stock_quantity" => 0,
  "max_quantity" => 20,
  "min_quantity" => 5,
  "buying_cost" => 9.99,
  "selling_price" => 19.99,
  "manufacturer_id" => manufacturer1.id,
  "category_id" => category1.id
  })
product5.save()
