require_relative('../db/sql_runner.rb')

class Category

  attr_reader :type, :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @type = options['type']
  end

  def products()
    sql = "SELECT categories.*, products.* FROM  categories
          INNER JOIN products
          ON categories.id = products.category_id
          WHERE categories.id = $1
          ORDER BY categories"
    values = [@id]
    products_array = SqlRunner.run(sql, values)
    return products_array.map { |product| Product.new(product) }
  end

  def number_products()
    sql = "SELECT categories.*, products.* FROM  categories
          INNER JOIN products
          ON categories.id = products.category_id
          WHERE categories.id = $1
          ORDER BY categories"
    values = [@id]
    products_array = SqlRunner.run(sql, values)
    result = products_array.map { |product| Product.new(product) }
    return result.count()
  end

  def save()
    sql = "INSERT INTO categories (type)
          VALUES ($1)
          RETURNING id"
    values = [@type]
    category = SqlRunner.run(sql, values).first
    @id = category['id'].to_i
  end

  def update()
    sql = "UPDATE categories
          SET name = $1
          WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM categories
          WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM categories"
    categories = SqlRunner.run(sql)
    result = categories.map { |category| Category.new(category) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM categories"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM categories WHERE id = $1"
    values = [id]
    categories = SqlRunner.run(sql, values).first
    result = Category.new(categories)
    return result
  end

  def self.destroy(id)
    sql = "DELETE FROM categories
          WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

end
