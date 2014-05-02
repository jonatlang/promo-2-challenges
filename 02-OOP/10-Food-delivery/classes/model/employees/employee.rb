class Employee
  attr_accessor :name, :password

  def initialize(name, password)
    @name = name
    @password = password
  end

  def to_s
    "#{@name}"
  end

  # Return what an employee can do, which is nothing by default.
  # Subclasses must override this method
  def capability
    nil
  end

  # Check whether an employee can perform the given action
  def can?(action)
    capability == action
  end
end
