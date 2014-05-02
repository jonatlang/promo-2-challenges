class Car
  attr_reader :model         # Can read the car model
  attr_writer :brand         # Can update the car brand
  attr_accessor :kilometers  # Can read and update the car mileage

  def initialize(model, brand, kilometers)
    @model = model
    @brand = brand
    @kilometers = kilometers
  end
end