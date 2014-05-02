# encoding: UTF-8

# A meal just has a name and a price

class Meal
  attr_accessor :name, :unit_price

  def initialize(name, unit_price)
    @name = name
    @unit_price = unit_price
  end

  def to_s
    "#{@name} - #{unit_price} €"
  end

  def <=>(other)
    @name <=> other.name
  end
end
