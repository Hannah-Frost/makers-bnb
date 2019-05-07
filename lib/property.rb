require 'pg'

class Property
  attr_reader :name, :description, :price

  def initialize(name:, description:, price:)
    @name = name
    @description = description
    @price = price
  end

  def self.all
    connection = PG.connect(dbname: 'makersbnb')
    result = connection.exec('SELECT * FROM properties;')
    result.map { |property|
      Property.new(name: property['name'], description: property['description'], price: property['price']) }
  end

  def self.add(name:, description:, price:)
    connection = PG.connect(dbname: 'makersbnb')
    connection.exec("INSERT INTO properties (name, description, price) VALUES('#{name}', '#{description}', '#{price}') RETURNING name, description, price")
  end
end
