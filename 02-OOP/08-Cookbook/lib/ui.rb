class UI
  TASKS = {
    list: "- List all recipes [list]",
    add:  "- Add a new recipe [add]",
    del:  "- Delete a recipe [del]",
    exit: "- Exit [exit]"
  }

  def initialize(controller)
    @controller = controller
    @running = true
  end

  def list
    recipes = @controller.list

    print "\n"
    puts recipes.map.with_index { |recipe, index| "#{index}. #{recipe}" }
  end

  def add
    puts "-- Enter a new recipe name -- \n"
    print "> "

    name = gets.chomp
    recipe = @controller.add(name)

    puts "Your #{recipe} has been added successfully !"
  end

  def del
    puts "-- Delete a recipe by specifying it's number -- \n"
    print "> "

    id = gets.chomp.to_i
    recipe = @controller.delete(id)

    puts "Your #{recipe} recipe has been successfully deleted !"
  end

  def exit
    @running = false
  end

  def user_input
    print "> "
    input = gets.chomp.to_sym

    unless TASKS.keys.include?(input)
      puts "Invalid input, please retry."
      self.user_input
    end

    input
  end

  def display
    puts "-- Welcome to the CookBook --"

    while @running
      print "\n"

      display_tasks
      dispatch(user_input)

      print "\n"
    end
  end

  ###
  ##  You don't need to modify the following methods !
  ###
  def display_tasks
    puts "What do you want to do? \n"
    puts TASKS.values
  end

  # The dispatch method takes a String or a Symbol as an argument
  # and calls the method with the same name.
  #
  #  Examples:
  #
  #   dispatch(:del) => Will call the `del` method in the current class
  #   dispatch("add") => Will call the `add` method in the current class
  #
  def dispatch(task)
    self.send(task.to_sym)
  end
end
