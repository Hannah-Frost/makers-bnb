require 'calendar'
require 'reset_test_database'

describe Calendar do
  describe '#add_day' do
    it 'stores a day' do
      PG.connect(dbname: 'makersbnb_test')

      calendar = Calendar.new
      calendar.add_day(1)

      expect(calendar.day).to eq 1
    end
  end

  describe '#add_month' do
    it 'stores a month' do
      PG.connect(dbname: 'makersbnb_test')

      calendar = Calendar.new
      calendar.add_month('January')

      expect(calendar.month).to eq 'January'
    end
  end
end
