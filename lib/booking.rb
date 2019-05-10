require 'pg'

class Booking
  attr_reader :availability

  def initialize(availability:)
    @availability = availability
  end

end
