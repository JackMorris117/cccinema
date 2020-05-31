require_relative("../db/sql_runner")
require_relative("customer")
require_relative("ticket")


class Ticket

    attr :id
    attr_accessor :customer_id, :film_id

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @customer_id = options['customer_id'].to_i
        @film_id = options['film_id'].to_i
    end
    def save()
        sql = "INSERT INTO tickets
        (
          customer_id,
          film_id
        )
        VALUES
        (
          $1, $2
        )
        RETURNING id"
        values = [@customer_id, @film_id]
        ticket = SqlRunner.run( sql, values ).first
        @id = ticket['id'].to_i
    end
    def customer()
        sql = "SELECT * FROM customers WHERE customer_id =$1"
        values = [@id]
        customer_data = SqlRunner.run(sql, values)
        return Customer.new(customer_data)
    end

    def film()
        sql = "SELECT * FROM films WHERE film_id =$1"
        values = [@id]
        film_data = SqlRunner.run(sql, values)
        return Film.new(film_data)
    end

    def self.all()
        sql = "SELECT * FROM tickets"
        ticket_data = SqlRunner.run(sql)
        return Ticket.map_items(ticket_data)
    end
    def self.delete_all()
        sql = "DELETE FROM tickets"
        SqlRunner.run(sql)
    end
    def self.map_items(ticket_data)
        result = ticket_data.map { |ticket| Ticket.new( ticket ) }
        return result
    end


end