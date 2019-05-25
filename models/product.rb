require_relative('../db/sql_runner.rb')

class Product

  attr_reader :id, :name, :description, :stock_quantity, :buying_cost, :max_quantity, :min_quantity, :selling_price, :manufacturer_id, :category_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @description = options['description']
    @stock_quantity = options['stock_quantity'].to_i
    @max_quantity = options['max_quantity'].to_i
    @min_quantity = options['min_quantity'].to_i
    @buying_cost = options['buying_cost'].to_f
    @selling_price = options['selling_price'].to_f
    @manufacturer_id = options['manufacturer_id'].to_i
    @category_id = options['category_id'].to_i
  end

  def product_details()
    p "#{@name}"
    p "#{@description}"
    p "#{@stock_quantity}"
    p "#{@max_quantity}"
    p "#{@min_quantity}"
    p "#{@buying_cost}"
    p "#{@selling_price}"
    p "#{@manufacturer_id}"
    p "#{@category_id}"
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

  def stock_levels()
    return "Out of Stock" if @stock_quantity == 0
    return "Only #{@stock_quantity} in Stock" if @stock_quantity <= @min_quantity
    return "Available in Stock" if @stock_quantity > @min_quantity
  end


  def total_buying_cost()
    result = @stock_quantity * @buying_cost
    return result.round(2)
  end

  def total_selling_value()
    result = @stock_quantity * @selling_price
    return result.round(2)
  end

  def margin()
    gross_profit = (@selling_price - @buying_cost)
    result = (gross_profit / @selling_price) * 100
    return result
  end

  def markup()
      gross_profit = (@selling_price - @buying_cost)
      result = (gross_profit / @buying_cost) * 100
      return result
  end

  def save()
    sql = "INSERT INTO products (name, description, stock_quantity, max_quantity, min_quantity, buying_cost, selling_price, manufacturer_id, category_id)
          VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)
          RETURNING id"
    values = [@name, @description, @stock_quantity, @max_quantity, @min_quantity, @buying_cost, @selling_price, @manufacturer_id, @category_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE products
          SET (name, description, stock_quantity, max_quantity, min_quantity, buying_cost, selling_price, manufacturer_id, category_id) = ($1, $2, $3, $4, $5, $6, $7, $8, $9)
          WHERE id = $10"
    values = [@name, @description, @stock_quantity,  @max_quantity, @min_quantity, @buying_cost, @selling_price,@manufacturer_id, @category_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM products
          WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM products"
    products = SqlRunner.run(sql)
    result = products.map { |product| Product.new(product) }
    return result
  end

  def self.count_all()
    sql = "SELECT * FROM products"
    products = SqlRunner.run(sql)
    result = products.map { |product| Product.new(product) }
    return result.count()
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

  def self.destroy(id)
    sql = "DELETE FROM products
          WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

end
