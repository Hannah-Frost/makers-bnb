require 'pg'
require 'bcrypt'

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
    encrypted_password = BCrypt::Password.create(password)

    result = connection.exec("INSERT INTO users (name, email, password) VALUES('#{name}', '#{email}', '#{encrypted_password}') RETURNING name, email, password")
    User.new(name: result[0]['name'], email: result[0]['email'], password: result[0]['password'])
  end

  def self.exist?(email)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("SELECT * FROM users WHERE email = '#{email}'")
    user = User.new(name: result[0]['name'], email: result[0]['email'], password: result[0]['password'])
    return true if user.email == email
  end
end
