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

end
