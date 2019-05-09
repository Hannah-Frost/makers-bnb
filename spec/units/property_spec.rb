require 'property'
require 'reset_test_database'

describe Property do
  describe '#all' do
    it 'displays all properties' do
      PG.connect(dbname: 'makersbnb_test')

      Property.add(name: 'Large House', description: 'Large', price: '100')

      properties = Property.all

      expect(properties.length).to eq 1
      expect(properties.first).to be_a Property
      expect(properties.first.name).to eq 'Large House'
      expect(properties.first.description).to eq 'Large'
      expect(properties.first.price).to eq '100'
    end
  end
  
  describe '#add' do
    it 'adds a property' do
      PG.connect(dbname: 'makersbnb_test')

      property = Property.new(name: 'Small House', description: 'Small', price: '50')

      expect(property.name).to eq 'Small House'
      expect(property.description).to eq 'Small'
      expect(property.price).to eq '50'
    end
  end
end
