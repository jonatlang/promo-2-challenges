class Animal
  # Modify the following methods to enable chaining !
  def name(name)
    @name = name
    self
  end
  
  def specie(specie)
    @specie = specie
    self
  end
  
  def color(color)
    @color = color
    self
  end
  
  def natural_habitat(natural_habitat)
    @natural_habitat = natural_habitat
    self
  end
  
  def to_s
    "Name: #{@name}, Specie: #{@specie}, Color: #{@color}, Natural Habitat: #{@natural_habitat}"
  end
  
end