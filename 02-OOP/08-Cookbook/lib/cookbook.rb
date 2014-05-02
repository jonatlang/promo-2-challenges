require 'csv'

class Cookbook
  def initialize(file)
    @file = file
    @recipes = CSV.read(file).flatten
  end
  def all
    @recipes
  end

  def create(recipe)
    @recipes << recipe.capitalize
    self.save
    recipe # Here we just return the object that has been added
  end

  def destroy(id)
    recipe = @recipes.delete_at(id)
    self.save
    recipe # Here we just return the object that has been destroyed
  end

  def save
    CSV.open(@file, 'w') do |csv|
      @recipes.each do |recipe|
        csv.puts([recipe])
      end
    end
  end
end
