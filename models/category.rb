require_relative('../db/sql_runner.rb')

class Category

  attr_reader :type, :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @type = options['type']
  end

end
