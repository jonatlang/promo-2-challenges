require_relative 'menu_action'

# This is the class that will handle all user interaction
# It does serve both as a "View" and "Controller" as the same time!

class RestaurantUI

  # Start the UI for given restaurant
  def self.start_ui(restaurant)
    # Get all the available actions
    actions = available_actions

    puts "Welcome to #{restaurant.name} Restaurant!"

    while true
      employee = nil
      wrong_password = true

      # Identification loop
      while employee.nil? or wrong_password
        print 'Please identify yourself: '
        name = gets.chomp
        employee = restaurant.find_employee(name)

        if employee
          puts "All right #{employee.name}, enter your password:"
          print '> '
          password = gets.chomp
          wrong_password = password != employee.password
          puts 'Incorrect password!!' if wrong_password
        end
      end

      puts "Welcome, #{employee.name}!"
      puts "You are a #{employee.class.to_s}."

      # Menu loop
      while true
        possible_actions = []

        # Display all possible actions (ie. filter by access_level)
        puts 'What would you like to do?'
        actions.each do |action|
          if action.capabilities.include?(employee.capability)
            possible_actions << action
            puts "#{possible_actions.length}. #{action.title}"
          end
        end
        puts "#{possible_actions.length + 1}. Log out"

        # Get the user's choice
        print '> '
        choice = gets.chomp.to_i

        # Try again if incorrect input
        redo if choice <= 0
        # Loop back to the very beginning if logging out
        break if choice >= possible_actions.length + 1

        # Check again the action's required access level
        action = possible_actions[choice - 1]
        unless action.capabilities.include?(employee.capability)
          puts 'You don\'t have permission to do that!'
          redo
        end

        # Execute the action (ie. the block that was given when
        # creating the MenuAction instance)
        action.run(restaurant, employee)
      end
    end

    puts 'Bye bye!'
  end

  # Return all available actions
  def self.available_actions
    # This syntax does the following: if @actions is nil, assign it the given
    # Array and return it. If it's not nil, just return its values.
    # This is a quick way to creating a complex object only once in the lifetime
    # of an instance.
    @actions ||= [
        # Action to list all customers of the restaurant
        MenuAction.new('List customers', :manage) do |restaurant, _|
          puts '------'
          puts 'All customers:'

          restaurant.customers.each { |c| puts "#{c.to_s}\n----\n" }

          puts "#{restaurant.customers.length} customers ------"
        end,


        # Action to add a new customer
        MenuAction.new('Add customer', :manage) do |restaurant, _|
          puts '------'
          print 'New customer name: '
          name = gets.chomp

          contact = {}
          print 'address: '
          contact[:address] = gets.chomp

          print 'postal code: '
          contact[:postal_code] = gets.chomp

          print 'city: '
          contact[:city] = gets.chomp

          print 'phone number: '
          contact[:phone] = gets.chomp
          puts '------'

          restaurant.add_customer(name, contact)
        end,



        # Action to list all orders of the restaurant
        MenuAction.new('List orders', [:manage, :deliver]) do |restaurant, employee|
          if employee.can?(:manage)
            orders = restaurant.orders.all
            puts "All orders: #{orders.length} ----"
            puts orders
          elsif employee.can?(:deliver)
            orders = restaurant.orders.for_delivery_guy(employee)
            puts "Your orders: #{orders.length} ----"
            puts orders
          end
        end,



        # Action to add a new order
        MenuAction.new('Add an order', :manage) do |restaurant, employee|
          puts '------'
          puts 'Select the customer:'

          restaurant.customers.each_with_index { |c, idx| puts "#{idx+1}. #{c.to_s}\n" }

          customer = nil
          while customer.nil?
            print '> '
            choice = gets.chomp.to_i
            begin
              customer = restaurant.customers[choice - 1]
            rescue
              # just make sure we don't crash when choice-1 < 0
            end
          end

          # Here we implement a 'submenu' where the order can be taken to be
          # added to the restaurant
          items = []

          while true
            # Display the stock
            puts "What should be added to the order?"
            available_items = restaurant.inventory
            available_items.each_with_index { |item, idx| puts "#{idx}. #{item.to_s}" }
            puts "(Anything greater than #{available_items.length - 1} will end this menu)"

            # Get the customer's choice
            print '> '
            choice = gets.chomp.to_i
            break if choice >= available_items.length

            item = available_items[choice]

            # Request item quantity
            puts "Okay, so you want some #{item.name}! In which quantity?"
            print '> '
            quantity = gets.chomp.to_i

            # Add item to the order
            items << OrderItem.new(item.name, quantity, item.unit_price)
          end

          # Ask the manager the delivery guy he wants to assign this order to
          delivery_guy = nil
          while delivery_guy.nil?
            puts 'Who should deliver this order?'

            # List all delivery guys and build a hash to retrieve them easily by
            # object_id at the same time
            guys = {}
            restaurant.employees.each do |emp|
              next unless emp.can?(:deliver)

              guys[emp.object_id] = emp
              puts "##{emp.object_id} - #{emp.name}"
            end

            print '> #'
            id = gets.chomp
            delivery_guy = guys[id.to_i]
          end


          # Create the order with selected items and record it
          order = Order.new(delivery_guy, customer, items)
          restaurant.orders.add(order)
        end,


        # Action to request next order to be prepared
        MenuAction.new('Remove an order', :manage) do |restaurant, employee|
          orders = restaurant.orders.all
          order = order_select(orders)
          next if order.nil?

          # Remove the given order
          restaurant.orders.remove(order)
        end,

        # Action to list all employees of the restaurant
        MenuAction.new('List employees', :manage) do |restaurant, employee|
          puts "All employees: #{restaurant.employees.length} ----"
          puts restaurant.employees
        end,

        # Action to request next order to be prepared
        MenuAction.new('Complete an order', :deliver) do |restaurant, employee|
          if employee.can?(:deliver)
            orders = restaurant.orders.for_delivery_guy(employee)
            order = order_select(orders)
            next if order.nil?

            # Remove the given order
            restaurant.orders.remove(order)
          else
            puts 'C\'mon grandpa, you can\'t even drive!'
          end
        end
    ]
  end

  private
  def self.order_select(orders)
    if orders.length == 0
      puts "\n No orders!\n"
      return nil
    end

    # Show all orders with their ID
    puts 'Which order do you want to mark as delivered??'
    orders.each do |order|
      puts "##{order.num} - #{order.total_price.to_f.round(2)} € - #{order.delivery_guy.name}"
    end

    # Ask for an order id until we get one that exists
    begin
      print '> #'
      order_id  = gets.chomp.to_i
      order = orders.select { |o| o.num == order_id }.first
    end while order.nil?

    order
  end

end
