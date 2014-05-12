$LOAD_PATH << 'lib'
require 'database'
require 'active_record'

class Drink
  attr_accessor :title, :ingredients, :instructions, :cat, :method
  attr_reader :id, :errors

  def initialize(title)
    @title = title
  end

  def self.delete(title)
    db = Database.new
    statement = "delete from drink_table where title=(?)"
    db.execute(statement, title)
  end

  def self.find_by_title(title)
    statement = "select * from drink_table where title = ?;"
    db = Database.new
    db.execute(statement, title)
  end

  def add_method(arg)
    @method = arg
  end

  def add_category(arg)
    @cat = arg
  end

  def add_ingredients(arg)
    @ingredients = arg
  end

  def add_serve(arg)
    @serve = arg
  end

  def vaild?
    if Drink.find_by_title(self.title)
      @errors << "#{self.title} already exists."
    end
    @errors.empty?
  end

  def save
    db = Database.new
    statement = "insert into drink_table (title, cat, ingredients, serve, method) values(?,?,?,?,?);"
    bound_vars = [@title, @cat, @ingredients, @serve, @method]
    db.execute(statement, bound_vars)
    @id = db.execute("select last_insert_rowid();")
  end

  def update
    db = Database.new
    statement = "update drink_table set title=(?), cat=(?), ingredients=(?), serve=(?), method=(?) where title=(?)"
    bound_vars = [@title, @cat, @ingredients, @serve, @method, @title]
    db.execute(statement, bound_vars)
    @id = db.execute("select last_insert_rowid();")
  end

  def create_instances(statement, bind_vars = [])
    rows = Database.execute(statement, bind_vars)
    results = []
    rows.each do |row|
      drink = Drink.new(row["title"])
      drink.instance_variable_set(:@id, row["id"])
      results << drink
    end
    results
  end
end
