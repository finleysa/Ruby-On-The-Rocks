class Drink
  attr_accessor :name, :ingredients, :instructions
  
  def initialize(name)
    @name = name
  end
  
  def add_ingredients(*args)
    @ingredients = args
  end 
  
  def add_instructions(arg)
    @instructions = arg
  end
end