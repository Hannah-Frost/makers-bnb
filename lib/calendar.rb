require 'pg'
require_relative 'booking'

class Calendar
  attr_reader :month, :start_day, :end_day

  def initialize
    @month = "January"
    @start_day = 1
    @end_day = 3
    @unavailable = 0
  end

  def add_month(month)
    @month = month
  end

  def add_start_day(day)
    @start_day = day
  end

  def add_end_day(day)
    @end_day = day
  end

  def find_availability
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    calendar = connection.exec("SELECT month, day, availability FROM calendar WHERE month = '#{@month}' AND day BETWEEN '#{@start_day}' AND '#{@end_day}';")
    calendar.map { |date|
      booking = Booking.new(availability: date['availability'])
      if booking.availability == "N"
        @unavailable += 1
      else
      end
    }
  end

  def available?
    find_availability
    if @unavailable > 0
      @unavailable = 0
      false
    else
      true
    end
  end

  def book
    Booking.new("Y").add_booking(@month, @start_day, @end_day)
  end

end
