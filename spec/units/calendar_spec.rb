require 'calendar'
require 'reset_test_database'

describe Calendar do
  describe '#initialize' do
    it 'starts with day 1' do
      PG.connect(dbname: 'makersbnb_test')

      calendar = Calendar.new

      expect(calendar.day).to eq 1
    end

    it 'starts with month January' do
      PG.connect(dbname: 'makersbnb_test')

      calendar = Calendar.new

      expect(calendar.month).to eq "January"
    end
  end

  describe '#add_day' do
    it 'replaces day' do
      PG.connect(dbname: 'makersbnb_test')

      calendar = Calendar.new
      calendar.add_day(2)

      expect(calendar.day).to eq 2
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
end
