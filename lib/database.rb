$LOAD_PATH << 'db'
require 'sqlite3'

class Database < SQLite3::Database

  def initialize
  end

  def find_drinks(data_array)
    begin
      db = SQLite3::Database.open "drinklist.sqlite3"
      if data_array[0] == "name"
        stm = db.prepare("select title from drink_table where title like '%#{data_array[1]}%' order by title limit 10")
      elsif data_array[0] == "ingredients"
        stm = db.prepare("select title from drink_table where ingredients like '%#{data_array[1]}%' order by title limit 10")
      elsif data_array[0] == "cocktail"
        stm = db.prepare("select title, serve, ingredients from drink_table where cat='Cocktails' order by random() limit 1")
      elsif data_array[0] == "shot"
        stm = db.prepare("select title, serve, ingredients from drink_table where cat='Shots & Shooters' order by random() limit 1")
      end
      rs = stm.execute

      name_array = []
      i=0
      rs.each do |row|
        i = i+1
        puts "#{i}. #{row[0]}" if data_array[0] == "name" or data_array[0] == "ingredients"
        puts row if data_array[0] == "cocktail" or data_array[0] == "shot"

        name_array << row[0]
      end

      if name_array.length == 0
        print "No drinks found! :(\n"
      elsif (data_array[0] == "name" or data_array[0] == "ingredients") and name_array.length > 0
        print "\nWhich number would you like to see: "
        answer = gets.chomp.to_i
        title = name_array[answer -1]
        statement = "select title, serve, ingredients, method from drink_table where title = (?)"
        rs = db.execute(statement, title)
        puts
        rs.each do |row|
          puts row
        end
      end
    rescue SQLite3::Exception => e 
      puts "Exception occured"
      puts e
    ensure
      stm.close if stm
      db.close if db
    end
  end
  
  def execute(statement, bind_vars = [])
    begin
      db = SQLite3::Database.open "drinklist.sqlite3"
      db.execute(statement, bind_vars)
    ensure
      db.close
    end
  end
end
