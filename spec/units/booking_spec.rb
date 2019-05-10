require 'booking'
require 'reset_test_database'

describe Booking do
  describe '#initialize' do
    it 'stores availability of a date' do
      PG.connect(dbname: 'makersbnb_test')

      booking = Booking.new(availability: 'N')

      expect(booking.availability).to eq "N"
    end
  end
end
