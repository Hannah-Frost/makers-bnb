require 'pg'

class Calendar
  attr_reader :month, :day

  def initialize
    @month = "January"
    @day = 1
  end

  def add_month(month)
    @month = month
  end

  def add_day(day)
    @day = day
  end

  def self.find
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    connection.exec("SELECT * FROM calendar WHERE month = '#{@month}'")
  end

end
