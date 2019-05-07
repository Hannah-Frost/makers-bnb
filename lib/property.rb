class Property
  attr_reader :name, :desc, :price

  def initialize(name:, desc:, price:)
    @name = name
    @desc = desc
    @price = price
  end
def self.all
    connection = PG.connect(dbname: 'makersbnb')
    result = connection.exec('SELECT * FROM properties')
    result.map { |property|
      Property.new name: property['name'], desc: property['description'], price: property['price'] }
    end
end
