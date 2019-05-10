require 'pg'

class Booking
  attr_reader :availability

  def initialize(availability:)
    @availability = availability
  end

  def add_booking(month, start_day, end_day)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    connection.exec("UPDATE calendar SET availability = 'N' WHERE month = '#{month}' AND day BETWEEN '#{start_day}' AND '#{end_day}';")
  end

end
