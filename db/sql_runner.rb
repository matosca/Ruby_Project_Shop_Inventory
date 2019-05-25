require('pg')

class SqlRunner

  def self.run(sql, values = [])
    begin
      # db = PG.connect({ dbname: 'shop_inventory', host: 'localhost'})
      db = PG.connect({
        dbname: 'dfc0ii464tpop9',
        host: 'ec2-23-21-129-125.compute-1.amazonaws.com',
        port: '5432',
        user: 'wlcfdgoyliegag',
        password: '5bbdfbd63b4c9da8db41eed1b97804ba25c394b345269ae8c0d04831d247e205'})
      db.prepare("query", sql)
      result = db.exec_prepared("query", values)
    ensure
      db.close() if db != nil
    end
    return result
  end

end
