require_relative("../db/sql_runner")

class Customer

    attr :id
    attr_accessor :name, :funds

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @name = options['name']
        @funds = options['funds'].to_i
    end

    def save()
        sql = "INSERT INTO customers
        (
          name,
          funds
        )
        VALUES
        (
          $1, $2
        )
        RETURNING id"
        values = [@name, @funds]
        customer = SqlRunner.run( sql, values ).first
        @id = customer['id'].to_i
    end

    def film()
        sql = "SELECT films.* FROM films
        INNER JOIN tickets ON tickets.film_id = films.id WHERE customer_id = $1"
        values = [@id]
        film_data = SqlRunner.run(sql, values)
        return Film.map_items(film_data)

    end

    def self.all()
        sql = "SELECT * FROM customers"
        customer_data = SqlRunner.run(sql)
        return Customer.map_items(customer_data)
    end
      
    def self.delete_all()
        sql = "DELETE FROM customers"
        SqlRunner.run(sql)
    end

    def update()
        sql = "UPDATE customers SET name = $1, funds = $2 WHERE id = $3"
        values = [@name, @funds, @id]
        SqlRunner.run( sql, values )
    end

    def self.map_items(customer_data)
        result = customer_data.map { |customer| Customer.new( customer ) }
        return result
    end

    def self.find(id)
        sql = "SELECT * FROM customers WHERE id = $1"
        values = [id]
        result = SqlRunner.run(sql, values)
        customer = self.new(result.first)
        return customer
    end
    
    
       

end