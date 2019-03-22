require_relative('../db/sql_runner.rb')


class Manufacturer

  attr_reader :name, :country, :phone, :email, :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @country = options['country']
    @phone = options['phone']
    @email = options['email']
  end

end
