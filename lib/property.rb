require 'pg'
require_relative 'select'

class Property
  attr_reader :name, :description, :price

  def initialize(name:, description:, price:)
    @name = name
    @description = description
    @price = price
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec('SELECT * FROM properties;')
    result.map { |property|
      Property.new(name: property['name'], description: property['description'], price: property['price']) }
  end

  def self.add(name:, description:, price:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    connection.exec("INSERT INTO properties (name, description, price) VALUES('#{name}', '#{description}', '#{price}') RETURNING name, description, price")
  end

  def self.find_id(name:, description:)
    if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'makersbnb_test')
    else
    connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("SELECT * FROM properties WHERE name = #{name} and #{description};")
    Select.new(result[0]['id'])
  end

end
