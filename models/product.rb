require_relative('../db/product')

class Product

  attr_reader :id, :name, :description, :stock_quantity, :buying_cost, :selling_price, :order_date, :manufacturer_id, :category_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @description = options['description']
    @stock_quantity = options['stock_quantity']
    @buying_cost = options['buying_cost']
    @selling_price = options['selling_price']
    @order_date = options['order_date']
    @manufacturer_id = options['manufacturer_id'].to_i
    @category_id = options['category_id'].to_i
  end

end
