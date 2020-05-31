require_relative( 'models/customer' )
require_relative( 'models/film' )
require_relative( 'models/ticket' )

require( 'pry-byebug' )
Customer.delete_all
Film.delete_all
Ticket.delete_all

customer1 = Customer.new({'name' => 'Jack', 'funds' => 10})
customer1.save
customer2 = Customer.new({'name' => 'Robyn', 'funds' => 20})
customer2.save
customer3 = Customer.new({'name' => 'Georgia', 'funds' => 30})
customer3.save
customer4 = Customer.new({'name' => 'Danny', 'funds' => 40})
customer4.save
customer5 = Customer.new({'name' => 'Emma', 'funds' => 50})
customer5.save

film1 = Film.new({'title' => 'Avengers: ENDGAME', 'price' => 10 })
film1.save
film2 = Film.new({'title' => 'Moon', 'price' => 10 })
film2.save
film3 = Film.new({'title' => 'Interstellar', 'price' => 10 })
film3.save

ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id})
ticket1.save
ticket2 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film2.id})
ticket2.save
ticket3 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film1.id})
ticket3.save
ticket4 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film3.id})
ticket4.save
ticket5 = Ticket.new({'customer_id' => customer5.id, 'film_id' => film3.id})
ticket5.save












binding.pry
nil