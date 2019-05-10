require 'calendar'
require 'reset_test_database'

describe Calendar do
  describe '#initialize' do
    it 'starts with a start day of 1' do
      PG.connect(dbname: 'makersbnb_test')

      calendar = Calendar.new

      expect(calendar.start_day).to eq 1
    end

    it 'starts with a end day of 3' do
      PG.connect(dbname: 'makersbnb_test')

      calendar = Calendar.new

      expect(calendar.end_day).to eq 3
    end

    it 'starts with month January' do
      PG.connect(dbname: 'makersbnb_test')

      calendar = Calendar.new

      expect(calendar.month).to eq "January"
    end
  end

  describe '#add_start_day' do
    it 'replaces starting day' do
      PG.connect(dbname: 'makersbnb_test')

      calendar = Calendar.new
      calendar.add_start_day(2)

      expect(calendar.start_day).to eq 2
    end
  end

  describe '#add_end_day' do
    it 'replaces ending day' do
      PG.connect(dbname: 'makersbnb_test')

      calendar = Calendar.new
      calendar.add_end_day(4)

      expect(calendar.end_day).to eq 4
    end
  end

  describe '#add_month' do
    it 'replaces month' do
      PG.connect(dbname: 'makersbnb_test')

      calendar = Calendar.new
      calendar.add_month('February')

      expect(calendar.month).to eq 'February'
    end
  end

  describe '#available?' do
    it 'returns true if all dates are available' do
      PG.connect(dbname: 'makersbnb_test')

      calendar = Calendar.new
      calendar.find_availability

      expect(calendar.available?).to eq true
    end

    it 'returns false if date(s) are unavailable' do
      connection = PG.connect(dbname: 'makersbnb_test')
      connection.exec("INSERT INTO calendar (property, month, day, availability) VALUES('House', 'January', '1', 'N')")

      calendar = Calendar.new
      calendar.find_availability

      expect(calendar.available?).to eq false
    end
  end
end
