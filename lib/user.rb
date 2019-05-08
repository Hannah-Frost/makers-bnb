require 'pg'

class User
  attr_reader :name, :email, :password

  def initialize(name:, email:, password:)
    @name = name
    @email = email
    @password = password
  end

  def self.add(name:, email:, password:)
    if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    connection.exec("INSERT INTO users (name, email, password) VALUES('#{name}', '#{email}', '#{password}') RETURNING name, email, password")

  end

end
