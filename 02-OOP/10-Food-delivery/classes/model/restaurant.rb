# encoding: UTF-8

require_relative 'orders_list'
require_relative 'meal'
require_relative 'customer'


class Restaurant
  attr_accessor :name
  attr_reader :orders, :customers, :order_history

  def initialize(name)
    @name = name
    @orders = OrdersList.new
    @employees = {}
    @customers = []
    @inventory = []
    @order_history = []
  end

  def add_meal(name, unit_price)
    @inventory << Meal.new(name, unit_price)
  end

  def inventory
    @inventory.sort!
  end

  def add_employee(employee)
    @employees[employee.name] = employee
  end

  def find_employee(name)
    @employees[name]
  end

  def employees
    @employees.values
  end

  def add_customer(name, contact)
    @customers << Customer.new(name, contact)
  end
end
