require_relative 'cookbook'

class Controller
  def initialize(file)
    @cookbook = Cookbook.new(file)
  end

  def list
    @cookbook.all
  end

  def add(name)
    @cookbook.create(name)
  end

  def delete(id)
    @cookbook.destroy(id)
  end
end
