require_relative('../db/sql_runner.rb')

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

  def manufacturer()
    manufacturer = Manufacturer.find(@manufacturer_id)
    result = manufacturer.name()
    return result
  end

  def category()
    category = Category.find(@category_id)
    result = category.type()
    return result
  end

  def save()
    sql = "INSERT INTO products (name, description, stock_quantity, buying_cost, selling_price, order_date, manufacturer_id, category_id)
          VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
          RETURNING *"
    values = [@name, @description, @stock_quantity, @buying_cost, @selling_price, @order_date, @manufacturer_id, @category_id]
    product = SqlRunner.run(sql, values).first
    @id = product['id'].to_i
  end

  def update()
    sql = "UPDATE products
          SET (name, description, stock_quantity, buying_cost, selling_price, order_date, manufacturer_id, category_id) = ($1, $2, $3, $4, $5, $6, $7, $8)
          WHERE id = $9"
    values = [@name, @description, @stock_quantity, @buying_cost, @selling_price, @order_date, @manufacturer_id, @category_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM products
          WHERE id = $1"
    vaues = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM products"
    products = SqlRunner.run(sql)
    result = products.map { |product| Product.new(product) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM products"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM products
          WHERE id = $1"
    values = [id]
    product_data = SqlRunner.run(sql, values).first
    result = Product.new(product_data)
    return result
  end
end
