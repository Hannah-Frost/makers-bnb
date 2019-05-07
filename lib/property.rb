class Property
  attr_reader :name, :desc, :price

  def initialize(name:, desc:, price:)
    @name = name
    @desc = desc
    @price = price
  end

end
