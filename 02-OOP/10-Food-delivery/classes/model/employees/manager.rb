require_relative 'employee.rb'

require_relative '../order.rb'
require_relative '../order_item.rb'


class Manager < Employee
  def self.to_s
    "manager"
  end

  def initialize(name, password)
    # Make sure we call the Employee constructor
    super
    @created_orders = []
  end

  def to_s
    "#{@name} - MANAGER"
  end

  # Return what a manager can do
  def capability
    :manage
  end

  # The manager's performance: a powerful tool to know whether
  # your manager is a lazy ass :P
  # Just return the total amount of orders taken by the manager
  def performance
    @created_orders.reduce(0) { |memo, order| memo + order.total_price }
  end
end
