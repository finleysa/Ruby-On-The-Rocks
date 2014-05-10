require 'database'

class Drink
  attr_accessor :name, :ingredients, :instructions
  
  def initialize(name)
    @name = name
  end
  
   def self.find_by_name
    statement = "select * from injuries where name = ?;"
    create_instances(statement, name)[0]
  end
  
  def add_ingredients(*args)
    @ingredients = args
  end 
  
  def add_instructions(arg)
    @instructions = arg
  end
  
  def save
    if self.valid?
      statement = "Insert into drink_table (name) values (?);"
      Database.execute(statement, name)
      @id = Database.execute("select last_insert_rowid();")
      true
    else
      false
    end
  end
  
  def vaild?
    if Drink.find_by_name(self.name)
      @errors << "#{self.name} already exists."
    end
    @errors.empty?
  end
  
  def create_instances(statement, bind_vars = [])
    
  end
end