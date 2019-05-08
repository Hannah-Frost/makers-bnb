require 'property'
require 'reset_test_database'

describe Property do
  it 'displays all properties' do
    PG.connect(dbname: 'makersbnb_test')

    property = Property.add(name: 'Large House', description: 'Large', price: '100')

    properties = Property.all

    expect(properties.length).to eq 1
    expect(properties.first).to be_a Property
    expect(properties.first.name).to eq 'Large House'
    expect(properties.first.description).to eq 'Large'
    expect(properties.first.price).to eq '100'
  end
end
